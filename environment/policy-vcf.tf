resource "nsxt_policy_security_policy" "vcf_fleet_mgmt_policy" {
  display_name    = "VCF Fleet Management"
  description     = "VCF Fleet Management Environment Rules"
  category        = "Environment"
  locked          = false
  stateful        = true
  tcp_strict      = true
  scope           = [var.group_paths.sg-vcf-fleet]
  sequence_number = 20

  rule {
    display_name       = "Fleet Mgmt to Fleet Mgmt"
    description        = "Fleet Management Servers Access"
    source_groups      = [var.group_paths.sg-vcf-fleet]
    destination_groups = [var.group_paths.sg-vcf-fleet]
    services           = []
    action             = "JUMP_TO_APPLICATION"
    logged             = true
    sequence_number    = 10
  }

  rule {
    display_name       = "Fleet Mgmt to Workload Domains"
    description        = "Fleet Mgmt to Workload Domains"
    source_groups      = [var.group_paths.sg-vcf-fleet]
    destination_groups = [var.group_paths.sg-vcf-m01]
    services           = [var.service_paths.https]
    action             = "ALLOW"
    logged             = true
    sequence_number    = 20
  }

  rule {
    display_name       = "SDDC Manager to vCenters"
    description        = "SDDC Manager to vCenters"
    source_groups      = [var.group_paths.sg-vcf-sddcmgr]
    destination_groups = [var.group_paths.sg-vcf-m01-vcenter]
    services           = [var.service_paths.vcf_vami_5480]
    action             = "ALLOW"
    logged             = true
    sequence_number    = 30
  }

  # rule {
  #   display_name       = "Workload Domains to Ops for Net Collector"
  #   description        = "Workload Domains to Ops for Net Collector"
  #   source_groups      = [var.group_paths.sg-vcf-m01]
  #   destination_groups = [var.group_paths.UPDATE]
  #   services           = [var.service_paths.vcf_ops_net_col]
  #   action             = "ALLOW"
  #   logged             = true
  #   sequence_number    = 40
  # }

  rule {
    display_name       = "Supervisors to Ops Cloud Proxy"
    description        = "Supervisors to Ops Cloud Proxy"
    source_groups      = [var.group_paths.sg-vcf-m01-sup01]
    destination_groups = [var.group_paths.sg-vcf-operations-proxy]
    services           = [var.service_paths.https]
    action             = "ALLOW"
    logged             = true
    sequence_number    = 50
  }

  rule {
    display_name       = "Supervisors to VCF Automation"
    description        = "Supervisors to VCF Automation"
    source_groups      = [var.group_paths.sg-vcf-m01-sup01]
    destination_groups = [var.group_paths.sg-vcf-automation]
    services           = [var.service_paths.https]
    action             = "ALLOW"
    logged             = true
    sequence_number    = 60
  }

  rule {
    display_name       = "VCF Automation to Supervisors"
    description        = "VCF Automation to Supervisors"
    source_groups      = [var.group_paths.sg-vcf-automation]
    destination_groups = [var.group_paths.sg-vcf-m01-sup01]
    services           = [var.service_paths.kubernetes_api_6443]
    action             = "ALLOW"
    logged             = true
    sequence_number    = 70
  }

  rule {
    display_name       = "VCF License to vCenters"
    description        = "VCF Automation to Supervisors"
    source_groups      = [var.group_paths.sg-vcf-license]
    destination_groups = [var.group_paths.sg-vcf-m01-vcenter]
    services           = [var.service_paths.https]
    action             = "ALLOW"
    logged             = true
    sequence_number    = 80
  }

  rule {
    display_name       = "Deny all other traffic"
    source_groups      = []
    destination_groups = []
    services           = []
    action             = "ALLOW"
    logged             = true
    sequence_number    = 90
  }
}
