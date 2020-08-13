output "self_link" {
  value       = join("", google_storage_bucket.blogpriolixyz.*.self_link)
  description = "The URI of the created resource"
}

output "url" {
  value       = join("", google_storage_bucket.blogpriolixyz.*.url)
  description = "The base URL of the bucket, in the format gs://<bucket-name>"
}

output "name" {
  value       = join("", google_storage_bucket.blogpriolixyz.*.name)
  description = "The name of bucket"
}

output "public_ip" {
  value       = join("", google_compute_address.blogpriolixyz.*.address)
  description = "LB Public IP"
}