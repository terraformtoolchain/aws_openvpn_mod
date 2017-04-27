variable "subnet_id" {
	type		= "string"
	description = "(Required) The destination subnet of the openvpn instance."
}

variable "iam_profile" {
	type		= "string"
	description = "(Optional) The IAM profiles to attach to the instance."
	default		= ""
}

variable "dept_name" {
	type		= "string"
	description = "(Optional) The department to allocate AWS cost to."
	default		= "none"
}

variable "file_system_id" {
	type		= "string"
	description = "(Required) The efs registry to containing the Openvpn ACI."
}

variable "openvpn_version" {
	type		= "string"
	description = "(Required) The version of Openvpn to run."
	default		= "2.3.14"
}

variable "zone_id" {
	type		= "string"
	description = "(Required) The Route53 Zone ID to for the VPN instance. Should be a public dns zone."
}

variable "base_fqdn" {
	type		= "string"
	description = "(Required) The name of the dns zone that the instance will be accessible from. Ex. vpn.example.com."
}	
