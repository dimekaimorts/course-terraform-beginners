
# resource "local_file" "pet" {
#     filename = var.filename[count.index]
#     count = 3
# }

resource "local_file" "pet" {
    filename = var.filename[count.index]
    count = length(var.filename)
}

