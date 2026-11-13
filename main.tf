# Terraform Initialization
terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
    }
  }
}

provider "nsxt" {
  host                  = var.nsx_manager
  username              = var.nsx_username
  password              = var.nsx_password
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

module "groups" {
  source                = "./groups"

  # Core Services
  dns_servers           = var.dns_servers
  ntp_servers           = var.ntp_servers
  syslog_servers        = var.syslog_servers

  # VCF
  vcfops             = var.vcfops
  vcfops_cp          = var.vcfops_cp
  vcf_lic            = var.vcf_lic
  vcf_automation     = var.vcf_automation
  vcf_sddcmgr        = var.vcf_sddcmgr
  vcf_mgmt_svcs      = var.vcf_mgmt_svcs
  vcf_m01_vcenter    = var.vcf_m01_vcenter
  vcf_m01_nsxmgr     = var.vcf_m01_nsxmgr
  vcf_m01_nsx_edges  = var.vcf_m01_nsx_edges
  vcf_m01_esx_hosts  = var.vcf_m01_esx_hosts
  vcf_m01_sup01      = var.vcf_m01_sup01
}

module "services" {
  source                = "./services"

}

module "infrastructure" {
  source                = "./infrastructure"
  group_paths           = module.groups.group_paths
  service_paths         = module.services.service_paths
  context_profile_paths = module.services.context_profile_paths
}

module "environment" {
  source                = "./environment"
  group_paths           = module.groups.group_paths
  service_paths         = module.services.service_paths
  context_profile_paths = module.services.context_profile_paths

}

module "application" {
  source                = "./application"
  group_paths           = module.groups.group_paths
  service_paths         = module.services.service_paths
  context_profile_paths = module.services.context_profile_paths

}
