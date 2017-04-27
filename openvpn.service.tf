/*
[Unit]
Description=Openvpn Rkt
After=network-online.target var-lib-registry.mount
Requires=network-online.target var-lib-registry.mount
AssertPathExists=/var/lib/registry

[Service]
Type=simple
ExecStart=/usr/bin/rkt run --insecure-options=all --net=host /var/lib/registry/openvpn-"${ var.openvpn_version }"-linux-amd64.aci
ExecStop=/usr/bin/rkt gc --mark-only
Restart=always

[Install]
WantedBy=multi-user.target
*/

data "ignition_systemd_unit" "openvpn" {
	name	= "openvpn.service"
	enable	= "true"
	content = "[Unit]\nDescription=Openvpn Rkt\nAfter=network-online.target var-lib-registry.mount\nRequires=network-online.target var-lib-registry.mount\nAssertPathExists=/var/lib/registry\n\n[Service]\nType=simple\nExecStart=/usr/bin/rkt run --insecure-options=all --net=host /var/lib/registry/openvpn-${ var.openvpn_version }-linux-amd64.aci\nExecStop=/usr/bin/rkt gc --mark-only\nRestart=always\n\n[Install]\nWantedBy=multi-user.target"
}
