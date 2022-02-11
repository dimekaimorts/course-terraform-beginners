
# Using list variables
resource "random_pet" "my-pet" {
    prefix = var.prefix[0]
}

resource "local_file" "my-second-pet" {
    filename = "./second-pet.txt"
    content = var.file-content["statement1"]
}