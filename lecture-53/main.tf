
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

# 1. Create a policy to use AWS IAM Resource Type
# ===============================================
# a. Usando jsonencode o <<EOF
# resource "aws_iam_policy" "adminUser" {
#   name = "AdminUsers"
#   policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Effect" : "Allow",
#         "Action" : "*",
#         "Resource" : "*"
#       }
#     ]
#   })
# }
# ================================================
# b. Usando data resource
# resource "aws_iam_policy" "adminUser" {
#   name = "AdminUsers"
#   policy = data.local_file.json-policy-adminUser.content
# }

# data "local_file" "json-policy-adminUser" {
#     filename = "./admin-policy.json"
# }
# c. Usando file function
resource "aws_iam_policy" "adminUser" {
  name = "AdminUsers"
  policy = file("admin-policy.json")
}



# 2. Vinculamos la politica hacia un usuario
resource "aws_iam_user_policy_attachment" "lucy-admin-access" {
  user = aws_iam_user.admin-user.name

  policy_arn = aws_iam_policy.adminUser.arn
}

