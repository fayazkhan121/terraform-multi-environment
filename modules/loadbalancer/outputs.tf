output "alb_dns_name" {
  value = aws_lb.this.dns_name
}

output "alb_arn" {
  value = aws_lb.this.arn
}

output "http_target_group_arn" {
  value = aws_lb_target_group.http_tg.arn
}
