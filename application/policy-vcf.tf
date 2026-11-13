resource "nsxt_policy_security_policy" "vcf_operations_policy" {
  display_name    = "VCF Operations"
  description     = "VCF Operations Application Rules"
  category        = "Application"
  locked          = false
  stateful        = true
  tcp_strict      = true
  scope           = [var.group_paths.sg-vcf-operations, var.group_paths.sg-vcf-operations-proxy, var.group_paths.sg-vcf-license]
  sequence_number = 50

  rule {
    display_name       = "Ops to Ops HTTPS"
    source_groups      = [var.group_paths.sg-vcf-operations, var.group_paths.sg-vcf-operations-proxy, var.group_paths.sg-vcf-license]
    destination_groups = [var.group_paths.sg-vcf-operations, var.group_paths.sg-vcf-operations-proxy, var.group_paths.sg-vcf-license]
    services           = [var.service_paths.https]
    action             = "ALLOW"
    logged             = true
  }

  rule {
    display_name       = "Deny all other traffic"
    source_groups      = []
    destination_groups = []
    services           = []
    action             = "ALLOW"
    logged             = true
  }
}