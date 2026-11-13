output "service_paths" {
  description = "Map of all custom NSX service names defined in this module to their policy path, for consumption by every policy-bearing module (environment, infrastructure, application)"
  value = {
    # Builtin Services
    icmp_request          = data.nsxt_policy_service.icmp_request.path
    icmp_reply            = data.nsxt_policy_service.icmp_reply.path
    icmp_dest_un          = data.nsxt_policy_service.icmp_dest_un.path
    icmp_ttl              = data.nsxt_policy_service.icmp_ttl.path
    dns_tcp               = data.nsxt_policy_service.dns_tcp.path
    dns_udp               = data.nsxt_policy_service.dns_udp.path
    ntp                   = data.nsxt_policy_service.ntp.path
    syslog_udp            = data.nsxt_policy_service.syslog_udp.path
    syslog_tcp            = data.nsxt_policy_service.syslog_tcp.path
    icmp_request          = data.nsxt_policy_service.icmp_request.path
    # Custom Services
    logs_tcp_9543         = nsxt_policy_service.logs_tcp_9543.path
    logs_tcp_9000         = nsxt_policy_service.logs_tcp_9000.path
    syslog_tcp_1514       = nsxt_policy_service.syslog_tcp_1514.path
    syslog_tcp_6514       = nsxt_policy_service.syslog_tcp_6514.path
  }
}

output "context_profile_paths" {
  description = "Map of custom NSX context profile names defined in this module to their policy path, for consumption by every policy-bearing module (environment, infrastructure, application)"
  value = {
    cxt_dns = nsxt_policy_context_profile.cxt_dns.path
  }
}
