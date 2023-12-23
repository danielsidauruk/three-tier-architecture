variable "region" {
  type        = string
  description = "Default Region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "us-central1-c"
}


variable "db_settings" {
  description = "Map of the various DB Settings"
  type        = map(any)
  default = {
    user_name        = "user"
    instance_name    = "three-tier-instance"
    db_name          = "sample-database"
    database_tier    = "db-f1-micro"
    default_user     = "default"
    db_user          = "user"
    database_version = "MYSQL_8_0"
  }
}