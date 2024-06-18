provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

resource "aws_instance" "recovery_app" {
  provider          = aws.us-west-2
  ami               = "ami-08a0d1e16fc3f61ea"
  instance_type     = "t2.micro"

  tags = {
    Name = "RecoveryAppInstance"
  }
}
