data "nsxt_policy_context_profile" "cxt_tls_v12" {
  display_name = "TLS_V12"
}

data "nsxt_policy_context_profile" "cxt_tls_v13" {
  display_name = "TLS_V13"
}

data "nsxt_policy_service" "https" {
  display_name = "HTTPS"
}

resource "nsxt_policy_service" "vcf_vami_5480" {
  description  = "VCF VAMI"
  display_name = "vcf-vami"

  l4_port_set_entry {
    protocol          = "TCP"
    destination_ports = ["5480"]
  }
}

resource "nsxt_policy_service" "vcf_ops_net_col" {
  description  = "VCF Operations for Networks Collector Ports"
  display_name = "vcf-ops-net-collector"

  l4_port_set_entry {
    protocol          = "TCP"
    destination_ports = ["1991"]
  }
  l4_port_set_entry {
    protocol          = "UDP"
    destination_ports = ["2055"]
  }
nested_service_entry {
    display_name        = "HTTPS"
    nested_service_path = data.nsxt_policy_service.https.path
  }
}

resource "nsxt_policy_service" "kubernetes_api_6443" {
  description  = "Kubernetes API"
  display_name = "kubernetes-api"

  l4_port_set_entry {
    protocol          = "TCP"
    destination_ports = ["6443"]
  }
}