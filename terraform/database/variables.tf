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


variable "db_settings" {
  description = "Map of the various DB Settings"
  type        = map(any)
  default = {
    user_name        = "user"
    instance_name    = "mysql-three-tier-instance"
    db_name          = "mysql-database"
    database_tier    = "db-f1-micro"
    default_user     = "default"
    db_user          = "user"
    database_version = "MYSQL_5_7"
  }
}