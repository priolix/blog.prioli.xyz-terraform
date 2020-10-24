#resource "google_compute_backend_bucket" "hugo_premium" {
#  name        = "${replace("${var.domain_name}", ".", "")}premium"
#  bucket_name = google_storage_bucket.hugo.name
#  enable_cdn  = false
#}
#
#resource "google_compute_global_address" "hugo_premium" {
#  name         = "${replace("${var.domain_name}", ".", "")}premium"
#}
#
#resource "google_compute_url_map" "hugo_premium" {
#  name            = "${replace("${var.domain_name}", ".", "")}premium"
#  default_service = google_compute_backend_bucket.hugo_premium.self_link
#
#  host_rule {
#    hosts        = ["*"]
#    path_matcher = "allpaths"
#  }
#
#  path_matcher {
#    name            = "allpaths"
#    default_service = google_compute_backend_bucket.hugo_premium.self_link
#  }
#}
#
##HTTP
#resource "google_compute_target_http_proxy" "hugo_premium" {
#  name    = "static-http-${replace("${var.domain_name}", ".", "")}-premium"
#  url_map = google_compute_url_map.hugo_premium.self_link
#}

#resource "google_compute_global_forwarding_rule" "httphugopremium" {
#  name                  = "http${replace("${var.domain_name}", ".", "")}premium"
#  load_balancing_scheme = "EXTERNAL"
#  target                = google_compute_target_http_proxy.hugo_premium.self_link
#  ip_address            = google_compute_global_address.hugo_premium.address
#  port_range            = 80
#}
#
##HTTPS
#resource "google_compute_target_https_proxy" "hugo_premium" {
#  name             = "static-https-${replace("${var.domain_name}", ".", "")}-premium"
#  url_map          = google_compute_url_map.hugo_premium.self_link
#  ssl_certificates = [google_compute_managed_ssl_certificate.hugo.self_link]
#}
#
#resource "google_compute_global_forwarding_rule" "httpshugopremium" {
#  name                  = "https${replace("${var.domain_name}", ".", "")}premium"
#  load_balancing_scheme = "EXTERNAL"
#  target                = google_compute_target_https_proxy.hugo_premium.self_link
#  ip_address            = google_compute_global_address.hugo_premium.address
#  port_range            = 443
#}
#