# terraform {
#   backend "s3" {
#     bucket  = "absweather-bucket"
#     key     = "terraform/terraform.tfstate"
#     region  = "eu-central-1"
#     encrypt        = true
#   }
# }

resource "aws_key_pair" "absweather_key" {
  key_name = "absweather_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "web-staging" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = aws_key_pair.absweather_key.key_name

  tags = {
    Name = "staging"
  }

  provisioner "file" {
    source = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

# resource "aws_instance" "web-production" {
#   ami           = "${var.AMIS[var.AWS_REGION]}"
#   instance_type = "t2.micro"
#   tags = {
#     Name = "production"
#   }
# }
