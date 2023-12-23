variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "region" {
  type        = string
  description = "Default Region"
  default     = "asia-southeast1"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "asia-southeast1-a"
}

variable "load_balancer" {
  type        = map(any)
  description =  "Load Balancer Configuration"
  default = {
    forward_rule_name    = "fwd-three-tier"
    backend_service_name = "bs-three-tier"
    url_map_name         = "lb-three-tier"
    target_proxy_name    = "proxy-three-tier"
  }
}

variable "mig" {
  type = map(any)
  description = "Value of the MIG"
  default = {
    instance_template_name_prefix = "template-three-tier"
    mig_name                      = "mig-three-tier"
    mig_base_instance_name        = "three-tier"
    target_size                   = 2
    source_image                  = "debian-cloud/debian-11"
    machine_type                  = "e2-micro"
  }
}