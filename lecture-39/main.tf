
resource "local_file" "pet" {
    filename = "./pets.txt"
    content  = "Amamos a las mascotas!"
}

data "local_file" "dog" {
    filename = "./dog.txt"
}

