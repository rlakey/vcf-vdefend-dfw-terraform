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

  dns_servers           = var.dns_servers
  ntp_servers           = var.ntp_servers
  syslog_servers        = var.syslog_servers
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

# module "environment" {
#   source                = "./environment"

# }

# module "application" {
#   source                = "./application"

# }
