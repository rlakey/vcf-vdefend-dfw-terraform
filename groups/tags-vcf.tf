# Tag VCF Operations VMs
data "nsxt_policy_vm" "vcf_ops" {
  for_each     = toset(var.vcfops)
  display_name = each.value
}

resource "nsxt_policy_vm_tags" "vcf_ops_tags" {
  for_each    = data.nsxt_policy_vm.vcf_ops
  instance_id = each.value.id

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-operations" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF Operations Proxy VMs
data "nsxt_policy_vm" "vcf_ops_cp" {
  for_each     = toset(var.vcfops_cp)
  display_name = each.value
}

resource "nsxt_policy_vm_tags" "vcf_ops_cp_tags" {
  for_each    = data.nsxt_policy_vm.vcf_ops_cp
  instance_id = each.value.id

  dynamic "tag" {
  for_each = merge(local.vcf_common_tags_m01, { application = "vcf-operations-proxy" })
  content {
    scope = tag.key
    tag   = tag.value
    }
  }
}

# Tag VCF License Server VMs
data "nsxt_policy_vm" "vcf_lic" {
  for_each     = toset(var.vcf_lic)
  display_name = each.value
}

resource "nsxt_policy_vm_tags" "vcf_license_tags" {
  for_each    = data.nsxt_policy_vm.vcf_lic
  instance_id = each.value.id

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-license" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF vDefend License Hub VMs
data "nsxt_policy_vm" "vcf_vdefend_lic" {
  # If the variable is valid, coalesce returns the variable name.
  # If the variable is null or "", coalesce returns "SKIP".
  count        = coalesce(var.vcf_vdefend_lic, "SKIP") != "SKIP" ? 1 : 0
  display_name = var.vcf_vdefend_lic
}

resource "nsxt_policy_vm_tags" "vcf_vdefend_lic_tags" {
  count       = coalesce(var.vcf_vdefend_lic, "SKIP") != "SKIP" ? 1 : 0
  instance_id = data.nsxt_policy_vm.vcf_vdefend_lic[0].id

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-vdefend-license" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF SDDC Manager VMs
data "nsxt_policy_vm" "vcf_sddcmgr" {
  for_each     = toset(var.vcf_sddcmgr)
  display_name = each.value
}

resource "nsxt_policy_vm_tags" "vcf_sddcmgr_tags" {
  for_each    = data.nsxt_policy_vm.vcf_sddcmgr
  instance_id = each.value.id

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-sddcmgr" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF Automation VMs
## Find all VCF Automation VMs that start with the vcf_automation variable value
data "nsxt_policy_vms" "vcf_automation" {
  display_name = "^${var.vcf_automation}.*"
}

resource "nsxt_policy_vm_tags" "vcf_automation_tags" {
  for_each    = data.nsxt_policy_vms.vcf_automation.items
  instance_id = each.value

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-automation" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF Management Services VMs
## Find all VCF Management Services VMs that start with the vcf_mgmt_svcs variable value
data "nsxt_policy_vms" "vcf_mgmt_svcs" {
  display_name = "^${var.vcf_mgmt_svcs}.*"
}

resource "nsxt_policy_vm_tags" "vcf_mgmt_svcs_tags" {
  for_each    = data.nsxt_policy_vms.vcf_mgmt_svcs.items
  instance_id = each.value

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-mgmt-svcs" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF Operations for Networks Platform VMs
data "nsxt_policy_vm" "vcfops_net_platform" {
  for_each     = toset(var.vcfops_net_platform)
  display_name = each.value
}

resource "nsxt_policy_vm_tags" "vcfops_net_platform_tags" {
  for_each    = data.nsxt_policy_vm.vcfops_net_platform
  instance_id = each.value.id

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-operations-net-platform" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF Operations for Networks Collector VMs
data "nsxt_policy_vm" "vcfops_net_collector" {
  for_each     = toset(var.vcfops_net_collector)
  display_name = each.value
}

resource "nsxt_policy_vm_tags" "vcfops_net_collector_tags" {
  for_each    = data.nsxt_policy_vm.vcfops_net_collector
  instance_id = each.value.id

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-operations-net-collector" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF Management Domain vCenter
data "nsxt_policy_vm" "vcf_m01_vc" {
  display_name = var.vcf_m01_vcenter
}

resource "nsxt_policy_vm_tags" "vcf_m01_vc_tags" {
  instance_id = data.nsxt_policy_vm.vcf_m01_vc.id

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-m01-vcenter" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}

# Tag VCF Management Domain NSX Manager VMs
data "nsxt_policy_vm" "vcf_m01_nsxmgr" {
  for_each     = toset(var.vcf_m01_nsxmgr)
  display_name = each.value
}

resource "nsxt_policy_vm_tags" "vcf_m01_nsxmgr_tags" {
  for_each    = data.nsxt_policy_vm.vcf_m01_nsxmgr
  instance_id = each.value.id

  dynamic "tag" {
    for_each = merge(local.vcf_common_tags_m01, { application = "vcf-m01-nsxmgr" })
    content {
      scope = tag.key
      tag   = tag.value
    }
  }
}