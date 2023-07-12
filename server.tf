terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name = "Doorwa-keypair"

  tags = {
    Name = "Doorwa-DevOps-batch-server"
    env = "Production"
    owner = "Doorwa Kumbhaj"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

