provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_db_instance" "recovery_primary" {
  provider                = aws.us-east-1
  identifier              = "recovery-primary-instance-unique"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  username                = "root"
  password                = "password"
  engine_version          = "5.7"
  parameter_group_name    = "default.mysql5.7"
  skip_final_snapshot     = true
  multi_az                = true
  publicly_accessible     = false
  backup_retention_period = 7
}
