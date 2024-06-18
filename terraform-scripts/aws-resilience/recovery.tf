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

resource "aws_db_instance" "recovery_primary" {
  provider              = aws.us-west-2
  identifier            = "recovery-primary-instance"
  engine                = "mysql"
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  username              = "root"
  password              = "password"
  engine_version        = "5.7"
  parameter_group_name  = "default.mysql5.7"
  skip_final_snapshot   = true
  multi_az              = true
  publicly_accessible   = false
  backup_retention_period = 7
}
