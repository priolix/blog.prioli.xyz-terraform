terraform {
  required_version = "= 0.12.26"
  required_providers {
    google = "= 3.27"
    google-beta = "= 3.27"
  }
  backend "gcs" {
    bucket      = "spartan-studio-125417"
    prefix      = "blog.prioli.xyz"
    credentials = "account.json"
  }
}
provider "google" {
  credentials = file("account.json")
  project     = var.gcp_project_name
  region      = var.region
}