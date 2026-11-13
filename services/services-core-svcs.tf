data "nsxt_policy_service" "icmp_request" {
  display_name = "ICMP Echo Request"
}

data "nsxt_policy_service" "icmp_reply" {
  display_name = "ICMP Echo Reply"
}

data "nsxt_policy_service" "icmp_dest_un" {
  display_name = "ICMP Destination Unreachable"
}

data "nsxt_policy_service" "icmp_ttl" {
  display_name = "ICMP Time Exceeded"
}

data "nsxt_policy_service" "dns_tcp" {
  display_name = "DNS-TCP"
}

data "nsxt_policy_service" "dns_udp" {
  display_name = "DNS-UDP"
}

data "nsxt_policy_service" "ntp" {
  display_name = "NTP"
}

data "nsxt_policy_service" "syslog_udp" {
  display_name = "Syslog (UDP)"
}

data "nsxt_policy_service" "syslog_tcp" {
  display_name = "Syslog (TCP)"
}

# Context Profiles
data "nsxt_policy_context_profile" "cxt_dns" {
  display_name = "DNS"
}

resource "nsxt_policy_service" "logs_tcp_9543" {
  description  = "Log Insight Agent Ingestion API with TLS"
  display_name = "logs-tcp-9543"

  l4_port_set_entry {
    protocol          = "TCP"
    destination_ports = ["9543"]
  }
}

resource "nsxt_policy_service" "logs_tcp_9000" {
  description  = "Log Insight Agent Ingestion API without TLS"
  display_name = "logs-tcp-9000"

  l4_port_set_entry {
    protocol          = "TCP"
    destination_ports = ["9000"]
  }
}

resource "nsxt_policy_service" "syslog_tcp_1514" {
  description  = "Syslog over TLS Legacy Port"
  display_name = "syslog-tcp-1514"

  l4_port_set_entry {
    protocol          = "TCP"
    destination_ports = ["1514"]
  }
}

resource "nsxt_policy_service" "syslog_tcp_6514" {
  description  = "Syslog over TLS"
  display_name = "syslog-tcp-6514"

  l4_port_set_entry {
    protocol          = "TCP"
    destination_ports = ["6514"]
  }
}
