# this is just the default, can be created manually / probably good to not use default here (which implies setting google_cloud_scheduler_job.http_target.oauth_token.service_account_email which is probably a good idea)
resource "google_service_account" "cloud_build_scheduler" {
    account_id = "cloud-build-trigger-scheduler"
}
