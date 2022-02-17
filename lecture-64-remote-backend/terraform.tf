
terraform {
    backend "s3" {
        bucket = "<NAME_CLOUD_STORAGE>"
        key = "finance/terraform.tfstate" # La ruta donde se va a guardar
        region = "us-west-1"
        dynamodb_table = "state-locking"
    }
}