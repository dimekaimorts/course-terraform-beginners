
provider "aws" {
    region     = var.project_region
    access_key = var.credentials_lucy["access_key"]
    secret_key = var.credentials_lucy["secret_key"]
}

# 1. Creamos el bucket con un nombre unico
resource "aws_s3_bucket" "finance" {
    bucket = "finance-21092020"
    tags = {
        Description = "Finance and Payroll"
    }
}

# 2. Agregamos un objeto al bucket
resource "aws_s3_bucket_object" "finance-2020" {
    content = "/root/finance/finance-2020.doc"
    key     = "finance-2020.doc" # Name of the object will be uploaded
    bucket  = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance-data" {
    group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
    bucket = aws_s3_bucket.finance.id
    policy = jsonencode(
        {
            "Version" : "2012-10-17",
            "Statement" : [
                {
                    "Effect" : "Allow",
                    "Action" : "*",
                    "Resource" : "arn:aws:s3::${aws_s3_bucket.finance.id}/*",
                    "Principal": {
                        "AWS": [
                            "${data.aws_iam_group.finance-data.arn}"
                        ]
                    }
                }
            ]
        }
    )
}

