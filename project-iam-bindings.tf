module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = [var.project_id]
  mode     = "authoritative"

  bindings = {
    "roles/bigquerydatatransfer.serviceAgent" = ["serviceAccount:service-${data.google_project.project.number}@gcp-sa-bigquerydatatransfer.iam.gserviceaccount.com"],
  }
  depends_on = [
    module.enabled_google_apis
  ]
}
