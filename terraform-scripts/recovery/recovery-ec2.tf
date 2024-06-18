provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

resource "aws_instance" "recovery_app" {
  provider      = aws.us-west-2
  ami           = "ami-0b20a6f09484773af"  # Updated
  instance_type = "t2.micro"

  tags = {
    Name = "RecoveryAppInstance"
  }
}
