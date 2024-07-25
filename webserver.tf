resource "aws_instance" "webserver" {
  ami                    = "ami-09744628bed84e434"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sgweb.id]

  # apache web server with hello world
  user_data = <<-EOF
                  #!/bin/bash
                  sudo yum update -y
                  sudo yum install -y httpd
                  sudo chkconfig httpd on
                  sudo service httpd start
                  echo "<h1>hello world</h1>" | sudo tee /var/www/html/index.html
                  EOF

  tags = {
    Name = "apache"
  }
}
