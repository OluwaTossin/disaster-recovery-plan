provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_instance" "recovery_app" {
  provider      = aws.us-east-1
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = "t2.micro"

  tags = {
    Name = "RecoveryAppInstance"
  }
}
