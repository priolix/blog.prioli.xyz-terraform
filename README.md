Small Terraform code to set up a [Google Cloud Storage Bucket](https://cloud.google.com/storage) behind a [Google Gloud LoadBalancer](https://cloud.google.com/load-balancing   ) with SSL for public and static purposes like [Hugo](https://gohugo.io/) website.  
Usage :  
```
terraform apply -var-file=00-variables.tfvars
```