# NSX Manager connection
variable "nsx_manager" {
  type        = string
  description = "NSX Manager cluster VIP hostname or IP address"
}

variable "nsx_username" {
  type        = string
  description = "NSX Manager Enterprise Administrator username"
}

variable "nsx_password" {
  type        = string
  sensitive   = true
  description = "NSX Manager Enterprise Administrator password"
}

# Core Services
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
  description = "NTP server IP addresses"
}

# VCF Fleet Management
variable "vcfops" {
  type        = list(string)
  description = "VCF Operations VM names"

  validation {
    condition     = length(var.vcfops) > 0
    error_message = "You must provide at least one VM name in the vcfops list."
  }
 
  validation {
    # Loops through the list, trims spaces, checks the length, and ensures ALL evaluate to true
    condition     = alltrue([for vm in var.vcfops : length(trimspace(vm)) > 0])
    error_message = "VM names cannot be blank strings or contain only spaces."
  }
}

variable "vcfops_cp" {
  type        = list(string)
  description = "VCF Operations Cloud Proxy VM names"
}

variable "vcf_lic" {
  type        = list(string)
  description = "VCF License Server VM names"
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

# VCF Management Domain (M01) Components
variable "vcf_m01_vcenter" {
  type        = string
  description = "Management Domain vCenter Server VM name"
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

# vSphere
variable "vm_management_dvpg" {
  type        = string
  description = "VM Management distributed port group name (format: vds-name.pg-name)"
}
