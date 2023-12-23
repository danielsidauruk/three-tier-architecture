variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "services" {
  description = "List of Services to be enabled"
  type        = list(string)
  default     = [
    "compute", 
    "cloudresourcemanager", 
    "sqladmin", 
    "iam", 
    "secretmanager",
  ]
}

variable "region" {
  type        = string
  description = "Default Region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "us-central1-a"
}

variable "network" {
  type        = string
  description = "Name of the VPC network"
  default     = "three-tier"
}

variable "subnets" {
  type = list(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
  description = "List of the subnets"
  default = [
    {
      name          = "iowa"
      region        = "us-central1"
      ip_cidr_range = "192.168.1.0/24"
    },
    {
      name          = "singapore"
      region        = "asia-southeast1"
      ip_cidr_range = "192.168.2.0/24"
    },
  ]
}

variable "sa_name" {
  type        = string
  description = "Name of the service account to be created"
  default     = "application-server"
}

variable "roles" {
  description = "Name of the IAM roles to be assigned for the service account"
  type        = list(string)
  default     = [
    "secretmanager.secretAccessor",
    "cloudsql.client",
  ]
}

