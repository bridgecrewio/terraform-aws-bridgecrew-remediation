variable "apitoken" {
  type        = string
  sensitive   = true
  description = "Your Bridgecrew platform API"
}

variable "customer_name" {
  type        = string
  description = "Customer name identifier - e.g. Patreon, Bridgecrew"
}
