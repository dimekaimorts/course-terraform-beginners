# Dependencia implicita
resource "local_file" "petA" {
    filename = var.filename_id
    content  = "My favorite pet is ${random_pet.my-pet.id}"
}

resource "random_pet" "my-petA" {
    prefix    = var.prefix
    separator = var.separator
    length    = var.length
}

# Dependencia explicita
resource "local_file" "petB" {
    filename = var.filename_ed
    content  = "My favorite pet is Mr.Dog"

    depends_on = [
      random_pet.my-petB
    ]
}

resource "random_pet" "my-petB" {
    prefix    = var.prefix
    separator = var.separator
    length    = var.length
}