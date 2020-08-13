resource "google_compute_backend_bucket" "hugo" {
  name        = replace("${var.domain_name}", ".", "")
  bucket_name = google_storage_bucket.hugo.name
  enable_cdn  = false
}

resource "google_compute_address" "hugo" {
  name         = replace("${var.domain_name}", ".", "")
  network_tier = "STANDARD"
}

resource "google_compute_url_map" "hugo" {
  name            = replace("${var.domain_name}", ".", "")
  default_service = google_compute_backend_bucket.hugo.self_link

  host_rule {
    hosts        = ["*"]
    path_matcher = "allpaths"
  }

  path_matcher {
    name            = "allpaths"
    default_service = google_compute_backend_bucket.hugo.self_link
  }
}

#HTTP
resource "google_compute_target_http_proxy" "hugo" {
  name    = "static-http-${replace("${var.domain_name}", ".", "")}"
  url_map = google_compute_url_map.hugo.self_link
}

resource "google_compute_forwarding_rule" "httphugo" {
  name                  = "http${replace("${var.domain_name}", ".", "")}"
  load_balancing_scheme = "EXTERNAL"
  target                = google_compute_target_http_proxy.hugo.self_link
  ip_address            = google_compute_address.hugo.address
  port_range            = 80
  region                = var.region
  network_tier          = "STANDARD"
}

#HTTPS
resource "google_compute_target_https_proxy" "hugo" {
  name             = "static-https-${replace("${var.domain_name}", ".", "")}"
  url_map          = google_compute_url_map.hugo.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.hugo.self_link]
}

resource "google_compute_forwarding_rule" "httpshugo" {
  name                  = "https${replace("${var.domain_name}", ".", "")}"
  load_balancing_scheme = "EXTERNAL"
  target                = google_compute_target_https_proxy.hugo.self_link
  ip_address            = google_compute_address.hugo.address
  port_range            = 443
  region                = var.region
  network_tier          = "STANDARD"
}

resource "google_compute_managed_ssl_certificate" "hugo" {
  provider = google-beta
  name     = replace("${var.domain_name}", ".", "")
  project  = "spartan-studio-125417"
  managed {
    domains = ["${var.domain_name}."]
  }
}