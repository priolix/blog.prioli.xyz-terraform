provider "google" {
  credentials = file("account.json")
  project     = "spartan-studio-125417"
  region      = "us-west1"
}
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


