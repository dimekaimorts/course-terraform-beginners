
provider "aws" {
    region     = var.project_region
    access_key = var.credentials["access_key"]
    secret_key = var.credentials["secret_key"]
}
