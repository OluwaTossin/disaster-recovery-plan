provider "aws" {
  alias  = "us-west-2-rds"
  region = "us-west-2" # Alternate region
}

resource "aws_db_instance" "primary" {
  provider               = aws.us-west-2-rds
  identifier             = "primary-instance-recovery"
  engine                 = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = "root"
  password               = "password"
  engine_version         = "5.7"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  multi_az               = true
  publicly_accessible    = false
  backup_retention_period = 7
}
