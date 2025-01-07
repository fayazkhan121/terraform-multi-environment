resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  vpc_security_group_ids = var.security_group_ids
  associate_public_ip_address = var.assign_public_ip
  ebs_optimized               = var.enable_ebs_optimized

  key_name = var.key_name != "" ? var.key_name : null

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  tags = {
    Name = "${var.environment_name}-instance"
  }
}
