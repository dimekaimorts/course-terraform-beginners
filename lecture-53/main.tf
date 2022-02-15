
provider "aws" {
    region = var.project_region
    access_key = var.credentials_lucy["access_key"]
    secret_key = var.credentials_lucy["secret_key"]
}

resource "aws_iam_user" "admin-user" {
    name = "lucy2"
    tags = {
        Description = "Technical Team Leader"
    }
}


