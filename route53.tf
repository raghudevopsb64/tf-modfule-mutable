resource "aws_route53_record" "alb" {
  zone_id = "Z07578712H75FS9NNU2HC"
  name    = "${var.COMPONENT}-${var.ENV}.roboshop.internal"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_lb.alb.dns_name]
}

