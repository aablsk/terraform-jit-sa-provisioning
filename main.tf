terraform {
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
}

provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_project" "project" {
}

data "google_client_config" "client" {
}
