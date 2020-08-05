resource "google_storage_bucket" "blogpriolixyz" {
  name     = var.hugo_bucket_name
  location = "us-west1"

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  cors {
    origin          = ["http://${var.hugo_bucket_name}"]
    method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
    response_header = ["*"]
    max_age_seconds = 3600
  }

  force_destroy = true
}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.blogpriolixyz.name
  role = "roles/storage.objectViewer"
  members = [
    "allUsers",
  ]
}
