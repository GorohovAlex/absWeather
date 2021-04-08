variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "AMIS" {
  default = {
    eu-central-1 = "ami-0767046d1677be5a0"
  }
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "absweather_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "absweather_key.pub"
}
