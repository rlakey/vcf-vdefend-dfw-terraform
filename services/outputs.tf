output "service_paths" {
  description = "Map of all custom NSX service names defined in this module to their policy path, for consumption by every policy-bearing module (environment, infrastructure, application)"
  value = {
    tcp_1234_1235   = nsxt_policy_service.tcp_1234_1235.path
    tcp_1443        = nsxt_policy_service.tcp_1443.path
    tcp_1514        = nsxt_policy_service.tcp_1514.path
    tcp_16520       = nsxt_policy_service.tcp_16520.path
    tcp_1991        = nsxt_policy_service.tcp_1991.path
    tcp_2012_2020   = nsxt_policy_service.tcp_2012_2020.path
    tcp_2049        = nsxt_policy_service.tcp_2049.path
    tcp_3260        = nsxt_policy_service.tcp_3260.path
    tcp_30000_30005 = nsxt_policy_service.tcp_30000_30005.path
    tcp_4505_4506   = nsxt_policy_service.tcp_4505_4506.path
    tcp_5000        = nsxt_policy_service.tcp_5000.path
    tcp_5432        = nsxt_policy_service.tcp_5432.path
    tcp_5480        = nsxt_policy_service.tcp_5480.path
    tcp_5671        = nsxt_policy_service.tcp_5671.path
    tcp_6443        = nsxt_policy_service.tcp_6443.path
    tcp_6500        = nsxt_policy_service.tcp_6500.path
    tcp_6501_6502   = nsxt_policy_service.tcp_6501_6502.path
    tcp_6514        = nsxt_policy_service.tcp_6514.path
    tcp_7475_7476   = nsxt_policy_service.tcp_7475_7476.path
    tcp_8443        = nsxt_policy_service.tcp_8443.path
    tcp_9000        = nsxt_policy_service.tcp_9000.path
    tcp_9040        = nsxt_policy_service.tcp_9040.path
    tcp_9092        = nsxt_policy_service.tcp_9092.path
    tcp_9543        = nsxt_policy_service.tcp_9543.path
    udp_2055        = nsxt_policy_service.udp_2055.path
  }
}

output "context_profile_paths" {
  description = "Map of custom NSX context profile names defined in this module to their policy path, for consumption by every policy-bearing module (environment, infrastructure, application)"
  value = {
    internet_fqdns = nsxt_policy_context_profile.internet_fqdns.path
  }
}
