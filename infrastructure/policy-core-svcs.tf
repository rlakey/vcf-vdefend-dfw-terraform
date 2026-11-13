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
    services           = [data.nsxt_policy_service.icmp_request.path, data.nsxt_policy_service.icmp_reply.path, data.nsxt_policy_service.icmp_dest_un.path, data.nsxt_policy_service.icmp_ttl.path]
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
    destination_groups = [nsxt_policy_group.sg-core-svcs-dns.path]
    services           = [data.nsxt_policy_service.dns_udp.path, data.nsxt_policy_service.dns_tcp.path]
    profiles           = [data.nsxt_policy_context_profile.cxt_dns.path]
    action             = "ALLOW"
    logged             = true
  }

  rule {
    display_name       = "Allowed NTP Servers"
    source_groups      = []
    destination_groups = [nsxt_policy_group.sg-core-svcs-ntp.path]
    services           = [data.nsxt_policy_service.ntp.path]
    action             = "ALLOW"
    logged             = true
  }

  rule {
    display_name       = "Allowed Syslog Servers"
    source_groups      = []
    destination_groups = [nsxt_policy_group.sg-core-svcs-syslog.path]
    services           = [data.nsxt_policy_service.syslog_tcp.path, data.nsxt_policy_service.syslog_udp.path, nsxt_policy_service.logs_tcp_9543.path, nsxt_policy_service.logs_tcp_9000.path, nsxt_policy_service.syslog_tcp_1514.path, nsxt_policy_service.syslog_tcp_6514.path]
    action             = "ALLOW"
    logged             = true
  }

  rule {
    display_name       = "Deny Unknown Core Services"
    source_groups      = []
    destination_groups = []
    services           = [data.nsxt_policy_service.dns_udp.path, data.nsxt_policy_service.dns_tcp.path, data.nsxt_policy_service.ntp.path, data.nsxt_policy_service.syslog_tcp.path, data.nsxt_policy_service.syslog_udp.path, nsxt_policy_service.logs_tcp_9543.path, nsxt_policy_service.logs_tcp_9000.path, nsxt_policy_service.syslog_tcp_1514.path, nsxt_policy_service.syslog_tcp_6514.path]
    action             = "ALLOW"
    logged             = true
  }
}
