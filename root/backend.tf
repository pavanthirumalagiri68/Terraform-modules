# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "terraform-statefile-managing"
    key            = "vpc-project.tfstate"
    region         = "ap-south-1"
    profile        = "Terraform"
  }
}