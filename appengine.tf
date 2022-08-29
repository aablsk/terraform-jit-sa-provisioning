# necessary for serviceAccount:${var.project_id}@appspot.gserviceaccount.com as this only gets created when creating an AppEngine App
resource "google_app_engine_application" "app" {
    project = var.project_id
    location_id = "europe-west"

    depends_on = [
      module.enabled_google_apis
    ]
}

# creates "serviceAccount:service-${data.google_project.service.number}@gcp-gae-service.iam.gserviceaccount.com"
resource "google_project_service_identity" "gcp-gae" {
    provider = google-beta

    project = var.project_id
    service = "appenginestandard.googleapis.com"

    depends_on = [
      module.enabled_google_apis
    ]
}