output "group_paths" {
  description = "Map of all NSX group names defined in this module to their policy path, for consumption by every policy-bearing module (environment, infrastructure, application)"
  value = {
    # Core Services Groups
    sg-core-svcs-dns              = nsxt_policy_group.sg-core-svcs-dns.path
    sg-core-svcs-ntp              = nsxt_policy_group.sg-core-svcs-ntp.path
    sg-core-svcs-syslog           = nsxt_policy_group.sg-core-svcs-syslog.path

  }
}
