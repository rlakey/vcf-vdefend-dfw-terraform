resource "nsxt_policy_group" "sg-vcf-operations" {
  nsx_id       = "sg-vcf-operations"
  display_name = "sg-vcf-operations"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-operations"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-operations-proxy" {
  nsx_id       = "sg-vcf-operations-proxy"
  display_name = "sg-vcf-operations-proxy"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-operations-proxy"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-license" {
  nsx_id       = "sg-vcf-license"
  display_name = "sg-vcf-license"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-license"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-vdefend-license" {
  nsx_id       = "sg-vcf-vdefend-license"
  display_name = "sg-vcf-vdefend-license"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-vdefend-license"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-automation" {
  nsx_id       = "sg-vcf-automation"
  display_name = "sg-vcf-automation"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Name"
      operator    = "STARTSWITH"
      value       = var.vcf_automation
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-mgmt-svcs" {
  nsx_id       = "sg-vcf-mgmt-svcs"
  display_name = "sg-vcf-mgmt-svcs"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Name"
      operator    = "STARTSWITH"
      value       = var.vcf_mgmt_svcs
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-sddcmgr" {
  nsx_id       = "sg-vcf-sddcmgr"
  display_name = "sg-vcf-sddcmgr"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-sddcmgr"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-operations-net-platform" {
  nsx_id       = "sg-vcf-operations-net-platform"
  display_name = "sg-vcf-operations-net-platform"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-operations-net-platform"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-operations-net-collector" {
  nsx_id       = "sg-vcf-operations-net-collector"
  display_name = "sg-vcf-operations-net-collector"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-operations-net-collector"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-m01-vcenter" {
  nsx_id       = "sg-vcf-m01-vcenter"
  display_name = "sg-vcf-m01-vcenter"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-m01-vcenter"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-m01-nsxmgr" {
  nsx_id       = "sg-vcf-m01-nsxmgr"
  display_name = "sg-vcf-m01-nsxmgr"

  criteria {
    condition {
      member_type = "VirtualMachine"
      key         = "Tag"
      operator    = "EQUALS"
      value       = "application|vcf-m01-nsxmgr"
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-m01-esx" {
  nsx_id       = "sg-vcf-m01-esx"
  display_name = "sg-vcf-m01-esx"
  group_type   = "IPAddress"

  criteria {
    ipaddress_expression {
      ip_addresses = [var.vcf_m01_esx_hosts]
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-m01-nsx-edges" {
  nsx_id       = "sg-vcf-m01-nsx-edges"
  display_name = "sg-vcf-m01-nsx-edges"
  group_type   = "IPAddress"

  criteria {
    ipaddress_expression {
      ip_addresses = [var.vcf_m01_nsx_edges]
    }
  }
}

resource "nsxt_policy_group" "sg-vcf-m01-sup01" {
  nsx_id       = "sg-vcf-m01-sup01"
  display_name = "sg-vcf-m01-sup01"
  group_type   = "IPAddress"

  criteria {
    ipaddress_expression {
      ip_addresses = [var.vcf_m01_sup01]
    }
  }
}

# Group for all VCF Fleet/Instance Components
resource "nsxt_policy_group" "sg-vcf-fleet" {
  nsx_id       = "sg-vcf-fleet"
  display_name = "sg-vcf-fleet"

  criteria {
    path_expression {
      member_paths = [nsxt_policy_group.sg-vcf-operations.path, nsxt_policy_group.sg-vcf-operations-proxy.path, nsxt_policy_group.sg-vcf-license.path, nsxt_policy_group.sg-vcf-license.path, nsxt_policy_group.sg-vcf-automation.path, nsxt_policy_group.sg-vcf-mgmt-svcs.path, nsxt_policy_group.sg-vcf-sddcmgr.path, nsxt_policy_group.sg-vcf-operations-net-platform.path, nsxt_policy_group.sg-vcf-operations-net-collector.path]
    }
  }
}

# Group for all VCF Management Domain M01 Components
resource "nsxt_policy_group" "sg-vcf-m01" {
  nsx_id       = "sg-vcf-m01"
  display_name = "sg-vcf-m01"

  criteria {
    path_expression {
      member_paths = [nsxt_policy_group.sg-vcf-m01-vcenter.path, nsxt_policy_group.sg-vcf-m01-nsxmgr.path, nsxt_policy_group.sg-vcf-m01-esx.path, nsxt_policy_group.sg-vcf-m01-nsx-edges.path, nsxt_policy_group.sg-vcf-m01-sup01.path]
    }
  }
}

# Group for all VCF Components for all management and workload domains
resource "nsxt_policy_group" "sg-vcf-all" {
  nsx_id       = "sg-vcf-all"
  display_name = "sg-vcf-all"

  criteria {
    path_expression {
      member_paths = [nsxt_policy_group.sg-vcf-fleet.path, nsxt_policy_group.sg-vcf-m01.path]
    }
  }
}
