locals {
  project_id = get_env("GOOGLE_CLOUD_PROJECT")
  prefix     = "state"
}

remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "${local.project_id}-tf-state"
    prefix = "${local.prefix}/${path_relative_to_include()}"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = "${local.project_id}"
  region  = var.region
  zone    = var.zone
}
EOF
}