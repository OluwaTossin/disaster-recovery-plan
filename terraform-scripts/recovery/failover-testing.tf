provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

resource "aws_instance" "failover_test_instance" {
  provider      = aws.us-west-2
  ami           = "ami-0b20a6f09484773af"
  instance_type = "t2.micro"

  tags = {
    Name = "FailoverTestInstance"
  }
}
