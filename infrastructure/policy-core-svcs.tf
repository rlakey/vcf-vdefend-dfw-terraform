resource "nsxt_policy_security_policy" "icmp" {
  display_name    = "ICMP"
  description     = "ICMP"
  category        = "Infrastructure"
  locked          = false
  stateful        = true
  tcp_strict      = true
  sequence_number = 10

  rule {
    display_name       = "Allow ICMP"
    source_groups      = []
    destination_groups = []
    services           = [var.service_paths.icmp_request, var.service_paths.icmp_reply, var.service_paths.icmp_dest_un, var.service_paths.icmp_ttl]
    action             = "ALLOW"
    logged             = true
  }
}

resource "nsxt_policy_security_policy" "core_services" {
  display_name    = "Core Services"
  description     = "Core Services Infrastructure Rules"
  category        = "Infrastructure"
  locked          = false
  stateful        = true
  tcp_strict      = true
  sequence_number = 20

  rule {
    display_name       = "Allowed DNS Servers"
    source_groups      = []
    destination_groups = [var.group_paths.sg-core-svcs-dns]
    services           = [var.service_paths.dns_udp, var.service_paths.dns_tcp]
    profiles           = [var.context_profile_paths.cxt_dns]
    action             = "ALLOW"
    logged             = true
  }

  rule {
    display_name       = "Allowed NTP Servers"
    source_groups      = []
    destination_groups = [var.group_paths.sg-core-svcs-ntp]
    services           = [var.service_paths.ntp]
    action             = "ALLOW"
    logged             = true
  }

  rule {
    display_name       = "Allowed Syslog Servers"
    source_groups      = []
    destination_groups = [var.group_paths.sg-core-svcs-syslog]
    services           = [var.service_paths.syslog_tcp, var.service_paths.syslog_udp, var.service_paths.logs_tcp_9543, var.service_paths.logs_tcp_9000, var.service_paths.syslog_tcp_1514, var.service_paths.syslog_tcp_6514]
    action             = "ALLOW"
    logged             = true
  }

  rule {
    display_name       = "Deny Unknown Core Services"
    source_groups      = []
    destination_groups = []
    services           = [var.service_paths.dns_udp, var.service_paths.dns_tcp, var.service_paths.ntp, var.service_paths.syslog_tcp, var.service_paths.syslog_udp, var.service_paths.logs_tcp_9543, var.service_paths.logs_tcp_9000, var.service_paths.syslog_tcp_1514, var.service_paths.syslog_tcp_6514]
    action             = "ALLOW"
    logged             = true
  }
}
