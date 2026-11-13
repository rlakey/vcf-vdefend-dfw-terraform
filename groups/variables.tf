variable "dns_servers" {
  type        = list(string)
  description = "DNS server IP addresses"
}

variable "ntp_servers" {
  type        = list(string)
  description = "NTP server IP addresses"
}

variable "syslog_servers" {
  type        = list(string)
  description = "Syslog server IP addresses"
}

variable "vcfops" {
  type        = list(string)
  description = "VCF Operations VM names"
}

variable "vcf_lic" {
  type        = list(string)
  description = "VCF License Server VM names"
}

variable "vcf_vdefend_lic" {
  type        = string
  description = "vDefend License Hub VM name"
}

variable "vcfops_cp" {
  type        = list(string)
  description = "VCF Operations Cloud Proxy VM names"
}

variable "vcf_mgmt_svcs" {
  type        = string
  description = "VCF Management Services VM name prefix"
}

variable "vcf_automation" {
  type        = string
  description = "VCF Automation VM name prefix"
}

variable "vcf_sddcmgr" {
  type        = list(string)
  description = "SDDC Manager VM name"
}

variable "vcfops_net_platform" {
  type        = list(string)
  description = "VCF Operations for Networks Platform VM Names"
}

variable "vcfops_net_collector" {
  type        = list(string)
  description = "VCF Operations for Networks Collector VM Names"
}

# Management Domain Components
variable "vcf_m01_vcenter" {
  type        = string
  description = "Management domain vCenter Server VM name"
}

variable "vcf_m01_nsxmgr" {
  type        = list(string)
  description = "Management Domain NSX Manager VM names"
}

variable "vcf_m01_nsx_edges" {
  type        = string
  description = "Management domain NSX Edge node IP range (e.g. 172.16.10.61-172.16.10.64)"
}

variable "vcf_m01_esx_hosts" {
  type        = string
  description = "Management domain ESXi host IP range (e.g. 172.16.11.11-172.16.11.14)"
}

variable "vcf_m01_sup01" {
  type        = string
  description = "Management domain 01 Supervisor node IP range (e.g. 172.16.10.101-172.16.10.110)"
}