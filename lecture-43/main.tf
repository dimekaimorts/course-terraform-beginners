
resource "local_file" "pet" {
    for_each = toset(var.filename)
    filename = each.value
}
