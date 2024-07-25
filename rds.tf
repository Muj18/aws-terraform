resource "aws_db_instance" "project_db" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = var.project_database_name
  password             = var.project_database_password
  port                 = 3306
  db_subnet_group_name = aws_db_subnet_group.dbsubnetgroup.name
  availability_zone    = "eu-west-1a"
  skip_final_snapshot  = true

  tags = {
    Name = "project_db"
  }
}

# create database subnet group

resource "aws_db_subnet_group" "dbsubnetgroup" {
  name        = "dbsubnetgroup"
  subnet_ids  = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id, aws_subnet.private_subnet_3.id, aws_subnet.private_subnet_4.id]
  description = "subnet for the database instance"

  tags = {
    Name = "database subnet"
  }
}