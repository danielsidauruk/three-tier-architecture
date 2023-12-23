data "terraform_remote_state" "foundation" {
  backend = "gcs"
  config = {
    bucket = "${var.project_id}-tf-state"
    prefix = "state/foundation"
  }
}
