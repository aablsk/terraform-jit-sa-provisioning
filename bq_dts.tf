resource "google_project_service_identity" "bigquery_dts" {
  provider = google-beta

  project = var.project_id
  service = "bigquerydatatransfer.googleapis.com"
}