terraform {
  backend "s3" {
    bucket         = "tf-state-aws-tf-baseline-129596755502-us-east-1"
    key            = "envs/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-locks-aws-tf-baseline"
    encrypt        = true
  }
}
