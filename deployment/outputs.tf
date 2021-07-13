output "public_ip" {
  description = "public IP for ec2 instance"
  value = aws_instance.ec2_instance.public_ip
}