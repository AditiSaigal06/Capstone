create_cluster:
	eksctl create cluster -f my-eks-conf.yaml

delete_cluster:
	eksctl delete cluster -f my-eks-conf.yaml

describe_cluster:
	eksctl utils describe-stacks --region=us-east-1 --cluster=my-eks-523

aws_identity:
	aws sts get-caller-identity

set_context:
	eksctl utils write-kubeconfig --cluster=my-eks-523 --set-kubeconfig-context=true

enable_iam_sa_provider:
	eksctl utils associate-iam-oidc-provider --cluster=my-eks-201 --approve

create_cluster_role:
	kubectl apply -f rbac-role.yaml

create_iam_policy:--cluster-name
	curl -o iam_policy.json https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.2.0/docs/install/iam_policy.json
	aws iam create-policy \
		--policy-name AWSLoadBalancerControllerIAMPolicy \
		--policy-document file://iam_policy.json

create_service_account:
	eksctl create iamserviceaccount \
      --cluster=my-eks-523 \
      --namespace=demo \
      --name=aws-load-balancer-controller \
      --attach-policy-arn=arn:aws:iam::337384287907:policy/AWSLoadBalancerControllerIAMPolicy \
      --override-existing-serviceaccounts \
      --approve

deploy_cert_manager:
	kubectl apply \
		--validate=false \
		-f https://github.com/jetstack/cert-manager/releases/download/v1.1.1/cert-manager.yaml

deploy_ingress_controller:
	kubectl apply -f v2_2_0_full.yaml

deploy_application:
	kustomize build ./k8s | kubectl apply -f -

delete_application:
	kustomize build . | kubectl delete -f -
