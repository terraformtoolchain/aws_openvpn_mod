module "vpn" {
	source = "git::https://github.com/terraformtoolchain/aws_container_linux_mod.git?ref=v0.2.0"

	count					= "1"
	instance_type			= "t2.nano"
	ebs_optimized			= false
	vpc_security_group_ids	= "${ aws_security_group.openvpn.id }"
	subnet_id				= "${ var.subnet_id }"
	user_data				= "${ data.ignition_config.vpn.rendered }"
	iam_instance_profile	= "${ var.iam_profile }"
	dept_name				= "${ var.dept_name }"
}

resource "aws_security_group" "openvpn" {
	name		= "openvpn"
	description = "Allow traffic to default openvpn port"

	ingress {
		from_port	= 1194
		to_port		= 1194
		protocol	= "udp"
		cidr_blocks = [ "0.0.0.0/0" ]
	}

	egress {
		from_port	= 1194
		to_port		= 1194
		protocol	= "udp"
		cidr_blocks = [ "0.0.0.0/0" ]
	}
}

data "ignition_config" "vpn" {
	systemd = [
		"${ data.ignition_systemd_unit.registry.id }",
		"${ data.ignition_systemd_unit.openvpn.id }",
	]
}
