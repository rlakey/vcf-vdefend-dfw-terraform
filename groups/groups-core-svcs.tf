resource "nsxt_policy_group" "sg-core-svcs-dns" {
  nsx_id       = "sg-core-svcs-dns"
  display_name = "sg-core-svcs-dns"
  group_type   = "IPAddress"

  criteria {
    ipaddress_expression {
      ip_addresses = var.dns_servers
    }
  }
}

resource "nsxt_policy_group" "sg-core-svcs-ntp" {
  nsx_id       = "sg-core-svcs-ntp"
  display_name = "sg-core-svcs-ntp"
  group_type   = "IPAddress"

  criteria {
    ipaddress_expression {
      ip_addresses = var.ntp_servers
    }
  }
}

resource "nsxt_policy_group" "sg-core-svcs-syslog" {
  nsx_id       = "sg-core-svcs-syslog"
  display_name = "sg-core-svcs-syslog"
  group_type   = "IPAddress"

  criteria {
    ipaddress_expression {
      ip_addresses = var.syslog_servers
    }
  }
}
