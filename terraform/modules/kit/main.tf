# Define the security group to allow SSH and HTTP access
resource "aws_security_group" "kit_security_group" {
  name        = "kit-security-group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Define an EC2 instance
resource "aws_instance" "kit_ec2" {
  ami           = "ami-0ad522a4a529e7aa8" # Linux
  instance_type = "t2.micro"              # Free tier instance type

  availability_zone = var.aws_region
  key_name          = var.local_dev_keypair
  security_groups   = [aws_security_group.kit_security_group.name]

  tags = {
    Name = "kit-ec2"
  }
}