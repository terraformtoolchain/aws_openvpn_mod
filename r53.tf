resource "aws_route53_record" "vpn" {
	zone_id = "${ var.zone_id }"
	name	= "vpn.${ var.base_fqdn }"
	type	= "A"
	ttl		= "300"
	records = [ "${ module.vpn.public_ip }" ]
}
