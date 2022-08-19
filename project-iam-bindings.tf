module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = [var.project_id]
  mode     = "authoritative"

  bindings = {
    "roles/bigquerydatatransfer.serviceAgent" = ["serviceAccount:${google_project_service_identity.bigquery_dts.email}"],
  }
  depends_on = [
    module.enabled_google_apis,
    google_project_service_identity.bigquery_dts
  ]
}
