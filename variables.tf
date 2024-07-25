# VPC Variables
variable "region" {
  default     = "us-east-1"
  description = "AWS Region"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR Block"
}

variable "public_subnet_cidr_1" {
  default     = "10.0.1.0/24"
  description = "CIDR for the public subnet 1"
}

variable "public_subnet_cidr_2" {
  default     = "10.0.2.0/24"
  description = "CIDR for the public subnet 2"
}

variable "private_subnet_cidr_1" {
  default     = "10.0.3.0/24"
  description = "CIDR for the private subnet 1"
}

variable "private_subnet_cidr_2" {
  default     = "10.0.4.0/24"
  description = "CIDR for the private subnet 2"
}

variable "private_subnet_cidr_3" {
  default     = "10.0.5.0/24"
  description = "CIDR for the private subnet 3"
}

variable "private_subnet_cidr_4" {
  default     = "10.0.6.0/24"
  description = "CIDR for the private subnet 4"
}

variable "project_database_password" {
  description = "Password for the RDS database"
  sensitive   = true
}

variable "project_database_name" {
  description = "Username for the RDS database"
}
