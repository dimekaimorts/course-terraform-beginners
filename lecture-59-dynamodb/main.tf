
provider "aws" {
    region     = var.project_region
    access_key = var.credentials_lucy["access_key"]
    secret_key = var.credentials_lucy["secret_key"]
}

resource "aws_dynamodb_table" "cars" {
    name = "cars"
    hash_key = "VIN"
    billing_mode = "PAY_PER_REQUEST"
    
    attribute {
        name = "VIN"
        type = "S"
    }
}

resource "aws_dynamodb_table_item" "car-items" {
    table_name = aws_dynamodb_table.cars.name
    hash_key = aws_dynamodb_table.cars.hash_key

    item = jsonencode({
        "Manufacturer" : { "S": "Toyota"},
        "Make" : {"S" : "Corolla"},
        "Year" : {"N" : "2004"},
        "VIN"  : {"S" : random_string.random_vin.id}
    })
}

resource "random_string" "random_vin" {
    length = 17
    lower = false
    special = false
    number = true
}
