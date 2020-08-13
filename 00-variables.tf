variable "gcp_project_name" {
  type        = string
  default     = ""
  description = "Google Cloud Project Name"
}
variable "region" {
  type        = string
  default     = ""
  description = "Region"
}
variable "domain_name" {
  type        = string
  default     = ""
  description = "Domain Name"
}
variable "hugo_bucket_name" {
  type        = string
  default     = ""
  description = "Hugo Bucket Name"
}
variable "hugo_bucket_location" {
  type        = string
  default     = ""
  description = "Hugo Bucket Location"
}