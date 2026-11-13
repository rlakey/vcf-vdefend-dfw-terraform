variable "dns_servers" {
  type        = list(string)
  description = "DNS server IP addresses"
}

variable "ntp_servers" {
  type        = list(string)
  description = "NTP server IP addresses"
}

variable "syslog_servers" {
  type        = list(string)
  description = "Syslog server IP addresses"
}
