output "self_link" {
  value       = join("", google_storage_bucket.hugo.*.self_link)
  description = "The URI of the created resource"
}

output "url" {
  value       = join("", google_storage_bucket.hugo.*.url)
  description = "The base URL of the bucket, in the format gs://<bucket-name>"
}

output "name" {
  value       = join("", google_storage_bucket.hugo.*.name)
  description = "The name of bucket"
}

output "public_ip" {
  value       = join("", google_compute_address.hugo.*.address)
  description = "LB Public IP"
}