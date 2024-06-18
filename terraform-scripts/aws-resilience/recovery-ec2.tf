provider "aws" {
  alias  = "us-west-2-ec2"
  region = "us-west-2" # Alternate region
}

data "aws_ami" "ubuntu" {
  provider    = aws.us-west-2-ec2
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

resource "aws_instance" "app" {
  provider      = aws.us-west-2-ec2
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name = "AppInstance-Recovery"
  }
}
