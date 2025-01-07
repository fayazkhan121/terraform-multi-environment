terraform {
  backend "s3" {
    bucket         = "my-terraform-states"
    key            = "prod/terraform.tfstate"   # Different path for prod
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
