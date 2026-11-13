# Define the tags that are identical across all VMs
locals {
  common_tags = {
    zone            = "production"
    environment     = "nge-platform"
    workload_domain = "m01"
  }
}