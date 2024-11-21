# Creates private DNS Record
resource "aws_route53_record" "main" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "${var.name}.expense.internal"
  type    = "A"
  ttl     = 10
  records = [aws_instance.main.private_ip]
}

# Creates public dns record

# resource "aws_route53_record" "public" {
#   zone_id = "Z0520454XBSCKDOCPTCY"
#   name    = "${var.name}.cloudapps.today"
#   type    = "A"
#   ttl     = 10
#   records = [aws_instance.main.public_ip]
# }