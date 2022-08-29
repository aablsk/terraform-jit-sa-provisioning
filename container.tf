# necessary to create "serviceAccount:service-${data.google_project.project.number}@gcp-sa-gkenode.iam.gserviceaccount.com"
resource "google_project_service_identity" "containers" {
    provider = google-beta

    project = var.project_id
    service = "container.googleapis.com"

    depends_on = [
      module.enabled_google_apis
    ]
}