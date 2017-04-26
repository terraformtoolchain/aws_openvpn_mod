/*
[Unit]
Description=Mount EFS Registry
After=network.target

[Mount]
What="${ var.efs_registry }":/
Where=/var/lib/registry
Type=nfs
Options=nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2

[Install]
WantedBy=multi-user.target
*/

data "ignition_systemd_unit" "registry" {
	name	= "var-lib-registry.mount"
	enable	= true
	content = "[Unit]\\nDescription=Mount EFS Registry\\nAfter=network.target\\n\\n[Mount]\\nWhat=${ aws_efs_mount_target.registry.dns_name }:/openvpn\\nWhere=/var/lib/registry\\nType=nfs\\nOptions=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2\\n\\n[Install]\\nWantedBy=multi-user.target"
}
