# Hugo and Terraform on GCP
![Apache V2 License](http://img.shields.io/badge/license-Apache%20V2-blue.svg)  
Small Terraform code to set up a [Google Cloud Storage Bucket](https://cloud.google.com/storage) behind a [Google Gloud LoadBalancer](https://cloud.google.com/load-balancing   ) with SSL for public and static purposes like [Hugo](https://gohugo.io/) website.  
## Requirements
* terraform = 0.12.26
* account.json  
## Usage
Edit and replaces variables in **variables.tfvars**  
```
gcp_project_name     = "spartan-studio-125417"
region               = "us-west1"
domain_name          = "blog.prioli.xyz"
hugo_bucket_name     = "blog.prioli.xyz"
hugo_bucket_location = "us-west1"
```
and  
In **01-terraform.tf**  
```
  backend "gcs" {
    bucket      = "spartan-studio-125417"
    prefix      = "blog.prioli.xyz"
    credentials = "account.json"
  }
```
```
export GOOGLE_APPLICATION_CREDENTIALS="./account.json"
terraform plan -var-file=00-variables.tfvars
terraform apply -var-file=00-variables.tfvars
```