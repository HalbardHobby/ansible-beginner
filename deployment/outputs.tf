output "public_dns" {
  description = "public DNS for ec2 instance"
  value = aws_instance.ec2_instance.public_dns
}