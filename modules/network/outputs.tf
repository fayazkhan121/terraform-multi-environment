output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "ssh_sg_id" {
  value = aws_security_group.ssh_sg.id
}

output "lb_sg_id" {
  value = aws_security_group.web_lb_sg.id
}