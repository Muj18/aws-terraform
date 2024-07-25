# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "mujib-project-VPC"
  }
}

# Create Public Subnet 1 and 2
resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr_1
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Web public subnet 1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidr_2
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Web public subnet 2"
  }
}

# Create Private Subnet 1 and 2

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_cidr_1
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "Database private subnet 1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_cidr_2
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = false

  tags = {
    Name = "Database private subnet 2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_cidr_3
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "Database private subnet 3"
  }
}

resource "aws_subnet" "private_subnet_4" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_cidr_4
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "Database private subnet 4"
  }
}

# Create Internet Gateway and Attach it to VPC

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "VPC IGW"
  }
}

# Create Route Table and Add Public Route
resource "aws_route_table" "web-public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "web-public-rt" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.web-public-rt.id
}

# Set the security group for public subnet
resource "aws_security_group" "sgweb" {
  name        = "sgweb"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web server SG"
  }
}

# Set the security group for private subnet
resource "aws_security_group" "sgdatabasenew" {
  name        = "sgdatabasenew"
  description = "Allow traffic from public subnet"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr_1]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr_1]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.public_subnet_cidr_1]
  }

  tags = {
    Name = "database SG"
  }
}
