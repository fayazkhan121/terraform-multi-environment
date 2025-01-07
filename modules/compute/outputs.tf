output "instance_id" {
  value = aws_instance.this.id
}

output "public_ip" {
  value = aws_instance.this.public_ip
}

output "private_ip" {
  value = aws_instance.this.private_ip
}

output "iam_instance_profile" {
  value = aws_iam_instance_profile.ec2_profile.name
}
