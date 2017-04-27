data "ignition_systemd_unit" "registry_automount" {
	name	= "var-lib-registry.automount"
	enable	= true
	content = "[Unit]\nDescription=EFS Registry Automount\nAfter=network-online.target\n\n[Automount]\nWhere=/var/lib/registry\n\n[Install]\nWantedBy=multi-user.target"
}
