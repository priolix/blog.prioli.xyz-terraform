resource "google_compute_backend_bucket" "blogpriolixyz" {
  name        = "blogpriolixyz"
  bucket_name = google_storage_bucket.blogpriolixyz.name
  enable_cdn  = false
}

resource "google_compute_global_address" "blogpriolixyz" {
  name = "blogpriolixyz"
}

resource "google_compute_url_map" "blogpriolixyz" {
  name            = "blogpriolixyz"
  description     = "a description"
  default_service = google_compute_backend_bucket.blogpriolixyz.self_link

  host_rule {
    hosts = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_bucket.blogpriolixyz.self_link
  }
}

#HTTP
resource "google_compute_target_http_proxy" "blogpriolixyz" {
  name             = "static-http-blogpriolixyz"
  url_map          = google_compute_url_map.blogpriolixyz.self_link
}

resource "google_compute_global_forwarding_rule" "httpblogpriolixyz" {
  name       = "httpblogpriolixyz"
  target     = google_compute_target_http_proxy.blogpriolixyz.self_link
  ip_address = google_compute_global_address.blogpriolixyz.address
  port_range = 80
}

#HTTPS
resource "google_compute_target_https_proxy" "blogpriolixyz" {
  name             = "static-https-blogpriolixyz"
  url_map          = google_compute_url_map.blogpriolixyz.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.blogpriolixyz.self_link]
}

resource "google_compute_global_forwarding_rule" "httpsblogpriolixyz" {
  name       = "httpsblogpriolixyz"
  target     = google_compute_target_https_proxy.blogpriolixyz.self_link
  ip_address = google_compute_global_address.blogpriolixyz.address
  port_range = 443
}

resource "google_compute_managed_ssl_certificate" "blogpriolixyz" {
  provider = google-beta
  name = "blogpriolixyz"
  project = "spartan-studio-125417"
  managed {
    domains = ["blog.prioli.xyz."]
  }
}