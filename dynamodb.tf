# DynamoDB for backend
resource "aws_dynamodb_table" "Nikhil-terraform-lock" {
  # Give unique name for dynamo table name
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Name" = "DynamoDB Terraform State Lock Table"
  }
}