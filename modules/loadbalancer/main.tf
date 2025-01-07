resource "aws_lb" "this" {
  name               = "${var.environment_name}-alb"
  load_balancer_type = "application"
  security_groups    = var.security_group_ids
  subnets            = var.subnet_ids

  tags = {
    Name = "${var.environment_name}-alb"
  }
}

# Target group for HTTP
resource "aws_lb_target_group" "http_tg" {
  name        = "${var.environment_name}-tg-http"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.this.id  # or pass in as variable if needed
  target_type = "instance"
  health_check {
    path = "/"
    protocol = "HTTP"
    matcher  = "200"
  }
  tags = {
    Name = "${var.environment_name}-tg-http"
  }
}

# Attach each instance to the LB's target group
resource "aws_lb_target_group_attachment" "attach" {
  count               = length(var.target_instance_ids)
  target_group_arn    = aws_lb_target_group.http_tg.arn
  target_id           = var.target_instance_ids[count.index]
  port                = 80
}

# HTTP listener
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.this.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.http_tg.arn
  }
}
