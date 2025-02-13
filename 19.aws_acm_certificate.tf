resource "aws_acm_certificate" "certificate"{
domain_name = "*.moreiraeduardo.com.br"
}

resource "aws_lb_listener_certificate" "certificate" {
  listener_arn    = aws_lb_listener.bia.arn
  certificate_arn = aws_acm_certificate.certificate.arn
}