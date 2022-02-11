resource "aws_instance" "webserver" {
    ami = "ami-0edab43b6fa892279"
    instance_type  = "t2.micro"
    tags = {
        Name = "ProjectX"
    }

    lifecycle {
        ignore_changes = [
            tags
        ]
    }
}