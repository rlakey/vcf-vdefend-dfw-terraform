# Define the tags that are identical across all VMs for M01
locals {
  vcf_common_tags_m01 = {
    zone            = "production"
    environment     = "vcf-platform"
    workload_domain = "m01"
  }
}

# Define the tags that are identical across all VMs for W01
locals {
  vcf_common_tags_w01 = {
    zone            = "production"
    environment     = "vcf-platform"
    workload_domain = "w01"
  }
}