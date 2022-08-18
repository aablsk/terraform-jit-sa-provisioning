data "http" "ping_bts_api" {
  url = "https://bigquerydatatransfer.googleapis.com/v1/projects/${var.project_id}/locations/${var.region}/transferConfigs"
  request_headers = {
    Accept        = "application/json"
    Authorization = "Bearer ${data.google_client_config.client.access_token}"
  }
  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status code [${self.status_code}] invalid"
    }
  }
  depends_on = [
    module.enabled_google_apis
  ]
}