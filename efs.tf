resource "aws_efs_mount_target" "registry" {
	file_system_id	= "${ var.file_system_id }"
	subnet_id		= "${ var.subnet_id }"
	security_groups = "${ aws_security_group.openvpn.id }"
}
