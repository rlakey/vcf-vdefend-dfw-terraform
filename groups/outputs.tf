output "group_paths" {
  description = "Map of all NSX group names defined in this module to their policy path, for consumption by every policy-bearing module (environment, infrastructure, application)"
  value = {
    # Core Services Groups
    sg-core-svcs-dns                = nsxt_policy_group.sg-core-svcs-dns.path
    sg-core-svcs-ntp                = nsxt_policy_group.sg-core-svcs-ntp.path
    sg-core-svcs-syslog             = nsxt_policy_group.sg-core-svcs-syslog.path

    # VCF Fleet Groups
    sg-vcf-operations               = nsxt_policy_group.sg-vcf-operations.path
    sg-vcf-operations-proxy         = nsxt_policy_group.sg-vcf-operations-proxy.path
    sg-vcf-license                  = nsxt_policy_group.sg-vcf-license.path
    sg-vcf-automation               = nsxt_policy_group.sg-vcf-automation.path
    sg-vcf-mgmt-svcs                = nsxt_policy_group.sg-vcf-mgmt-svcs.path
    sg-vcf-sddcmgr                  = nsxt_policy_group.sg-vcf-sddcmgr.path
    sg-vcf-operations-net-platform  = nsxt_policy_group.sg-vcf-operations-net-platform.path
    sg-vcf-operations-net-collector = nsxt_policy_group.sg-vcf-operations-net-collector.path
    sg-vcf-fleet                    = nsxt_policy_group.sg-vcf-fleet.path

    # VCF Management Domain Groups
    sg-vcf-m01-vcenter              = nsxt_policy_group.sg-vcf-m01-vcenter.path
    sg-vcf-m01-nsxmgr               = nsxt_policy_group.sg-vcf-m01-nsxmgr.path
    sg-vcf-m01-esx                  = nsxt_policy_group.sg-vcf-m01-esx.path
    sg-vcf-m01-nsx-edges            = nsxt_policy_group.sg-vcf-m01-nsx-edges.path
    sg-vcf-m01-sup01                = nsxt_policy_group.sg-vcf-m01-sup01.path
    sg-vcf-m01                      = nsxt_policy_group.sg-vcf-m01.path

    # VCF Misc
    sg-vcf-all                      = nsxt_policy_group.sg-vcf-all.path

  }
}
