resource "aws_instance" "recovery_app" {
  provider      = aws.us-west-2
  ami           = "ami-0b20a6f09484773af"
  instance_type = "t2.micro"

  tags = {
    Name = "RecoveryAppInstance"
  }
}
