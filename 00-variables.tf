variable "gcp_project_name" {
  type        = string
  default     = "spartan-studio-125417"
  description = "Google Cloud Project Name"
}
variable "region" {
  type        = string
  default     = "us-west1"
  description = "Region"
}

variable "hugo_bucket_name" {
  type        = string
  default     = "blog.prioli.xyz"
  description = "Hugo Bucket Name"
}
variable "hugo_bucket_location" {
  type        = string
  default     = "us-west1"
  description = "Hugo Bucket Location"
}