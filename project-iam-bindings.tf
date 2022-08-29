module "project-iam-bindings" {
  source   = "terraform-google-modules/iam/google//modules/projects_iam"
  projects = [var.project_id]
  mode     = "authoritative"

  bindings = {
    "roles/bigquerydatatransfer.serviceAgent" = ["serviceAccount:${google_project_service_identity.bigquery_dts.email}"],
    "roles/cloudbuild.builds.editor" = ["serviceAccount:${google_service_account.cloud_build_scheduler.email}"],
    "roles/monitoring.admin" = ["serviceAccount:${google_service_account.prometheus.email}"],
    "roles/appengine.serviceAgent" = [
      "serviceAccount:${google_project_service_identity.gcp-gae.email}",
      "serviceAccount:${var.project_id}@appspot.gserviceaccount.com"
    ],
    "roles/container.nodeServiceAgent" = [
      "serviceAccount:service-${data.google_project.project.number}@gcp-sa-gkenode.iam.gserviceaccount.com"
    ],
    "roles/cloudkms.serviceAgent" = [
      "serviceAccount:service-${data.google_project.project.number}@gcp-sa-cloudkms.iam.gserviceaccount.com"
    ]
  }
  depends_on = [
    module.enabled_google_apis,
    google_project_service_identity.bigquery_dts,
    google_service_account.prometheus,
    google_project_service_identity.gcp-gae,
    google_project_service_identity.containers,
    google_project_service_identity.cloudkms,
    google_app_engine_application.app
  ]
}
