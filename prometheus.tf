# can be created manually, this is just the default // probably a good idea to associate this manually
resource "google_service_account" "prometheus" {
    account_id = "collector"
}
