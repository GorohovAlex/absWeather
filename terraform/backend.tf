terraform {
  backend "s3" {
    bucket  = "absweather-bucket"
    key     = "terraform/terraform.tfstate"
    shared_credentials_file = "credentials"
    region  = "eu-central-1"
    encrypt = true
  }
}
