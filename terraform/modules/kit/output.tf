output "instance_ip" {
  description = "public IP address of the EC2 instance"
  value       = aws_instance.kit_ec2.public_ip
}
