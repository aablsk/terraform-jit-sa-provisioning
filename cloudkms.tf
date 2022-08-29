# creates "serviceAccount:service-${data.google_project.project.number}@gcp-sa-cloudkms.iam.gserviceaccount.com"
resource "google_project_service_identity" "cloudkms" {
    provider = google-beta

    project = var.project_id
    service = "cloudkms.googleapis.com"

    depends_on = [
      module.enabled_google_apis
    ]
}