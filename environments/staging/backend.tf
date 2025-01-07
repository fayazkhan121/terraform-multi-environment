terraform {
  backend "s3" {
    bucket         = "my-terraform-states"
    key            = "staging/terraform.tfstate"   # Different path for staging
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
