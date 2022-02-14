terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "1.4.0"
        }
    }
}

resource "local_file" "pet" {
    filename = "./pet.txt"
    content = "We love pets!"
}