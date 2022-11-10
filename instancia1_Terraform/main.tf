# Configure the AWS Provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAXN5XSS2XRIM5DCPZ"
  secret_key = "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"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "aws_instance_kparrao" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "aws_instance_kparrao"
  }
}
