####################################################################################################
# IAM
####################################################################################################
# IAM assume role
resource "aws_iam_role" "kit_ssm_role" {
  name = "kit-ec2-ssm-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

# Attach the AmazonSSMManagedInstanceCore policy to the role
resource "aws_iam_role_policy_attachment" "kit_ssm_role_policy" {
  role       = aws_iam_role.kit_ssm_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

####################################################################################################
# Security Group
####################################################################################################
# Define the security group to allow SSH and HTTP access
resource "aws_security_group" "kit_security_group" {
  name        = "kit-security-group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["42.60.8.26/32"]
    description = "Allow SSH access"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-ingress-sgr
    description = "Allow HTTP access"
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-ingress-sgr
    description = "Allow HTTPS access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] #tfsec:ignore:aws-ec2-no-public-egress-sgr
    description = "Allow all outbound traffic"
  }
}

####################################################################################################
# EC2
####################################################################################################
# Define an EC2 instance
resource "aws_instance" "kit_ec2" {
  ami           = "ami-0ad522a4a529e7aa8" # Linux
  instance_type = "t3.nano"               # Free tier instance type

  availability_zone = "ap-southeast-1a"
  key_name          = var.local_dev_keypair
  security_groups   = [aws_security_group.kit_security_group.name]

  # Root EBS Block Device
  root_block_device {
    volume_size = 30    # Size in GB
    volume_type = "gp2" # General Purpose SSD
    encrypted   = true
  }

  # Attach IAM role for SSM
  iam_instance_profile = aws_iam_instance_profile.kit_ssm_instance_profile.id

  # Metadata Options: Enforce HTTP Token
  # Instructions to get token:
  # # Step 1: Get the token (valid for 6 hours)
  # TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

  # # Step 2: Use the token to retrieve instance metadata
  # curl -H "X-aws-ec2-metadata-token: $TOKEN" "http://169.254.169.254/latest/meta-data/"
  metadata_options {
    http_tokens                 = "required" # Enforce IMDSv2 (tokens required)
    http_put_response_hop_limit = 1          # Limits the number of network hops
    instance_metadata_tags      = "disabled" # Disable instance metadata tags
  }

  tags = {
    Name = "kit-ec2"
  }
}
