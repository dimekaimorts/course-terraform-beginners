
resource "aws_instance" "webserver" {
    ami = var.webserver_ami_ubuntu
    instance_type = "t2.micro"

    tags = {
      "Name" = "webserver"
      "Descrption" = "An NGINX WebServer on Ubuntu"
    }

    user_data = <<-EOF
                #!/bin/bash
                sudo apt update
                sudo apt install nginx -y
                sudo systemctl enable nginx
                sudo systemctl start nginx
                EOF
    
    # 2. Agregar la llave
    key_name = aws_key_pair.web.id

    # 4. Agregamos el grupo de seguridad para ser usado por la VPC
    vpc_security_group_ids = [aws_security_group.ssh-access.id]
}

# 1. Debemos de crear una llave SSH para conectarnos
resource "aws_key_pair" "web" {
    public_key = file("./web.pem")
}

# 3. Agregamos el grupo de seguridad para el SSH
resource "aws_security_group" "ssh-access" {
    name = "ssh-access"
    description = "Allow SSH access from the Internet"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }
}

output "public_ip" {
    value = aws_instance.webserver.public_ip  
}
