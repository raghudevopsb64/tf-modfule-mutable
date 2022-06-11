resource "aws_lb_target_group" "target-group" {
  name     = "${var.COMPONENT}-${var.ENV}-tg"
  port     = var.PORT
  protocol = "HTTP"
  vpc_id   = var.VPC_ID
  health_check {
    enabled             = true
    healthy_threshold   = 3
    unhealthy_threshold = 2
    interval            = 5
    timeout             = 4
    path                = "/health"
    port                = var.PORT
  }
}

resource "aws_lb_target_group_attachment" "instances-to-tg" {
  count            = length(local.ALL_INSTANCE_IDS)
  target_group_arn = aws_lb_target_group.target-group.arn
  target_id        = element(local.ALL_INSTANCE_IDS, count.index)
  port             = var.PORT
}
