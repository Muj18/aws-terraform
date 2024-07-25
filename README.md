# DevOps Project: Terraform AWS Infrastructure with Web and Database Servers

## Overview
This project demonstrates the creation of a scalable and secure AWS infrastructure using Terraform. It sets up a VPC with two subnets, deploys a web server accessible from the internet, and a separate database server. The web server runs Apache and serves a simple "Hello World" page.

## Features
- VPC with two subnets (public and private)
- Web server in the public subnet with Apache installed
- Database server in the private subnet
- Security groups to manage access
- Terraform code designed to be run in any AWS account
- Shell script for Apache access log analysis

## Repository Structure
- `main.tf`: Main Terraform configuration file
- `variables.tf`: Variable definitions
- `outputs.tf`: Output definitions
- `webserver.tf`: Web server specific configurations
- `database.tf`: Database server specific configurations
- `network.tf`: VPC and network configurations
- `scripts/`: Directory containing shell scripts
  - `apache_log_analyser.sh`: Script to analyse Apache access logs

## Apache Log Analyser
The `apache_log_analyser.sh` script provides powerful analysis capabilities for Apache access logs. It can:

1. Extract all traffic from a specified IP address
2. Show the number of requests coming from each browser type
3. Count the number of different HTTP response codes (e.g., 200, 404)

This script is particularly useful for:
- Identifying potential security threats by analysing traffic from specific IP addresses
- Understanding your user base by examining browser usage
- Monitoring the health and performance of your web server by analysing response codes

Usage example:
```bash
./apache_log_analyser.sh /path/to/access.log 192.168.1.1
