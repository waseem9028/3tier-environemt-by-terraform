resource "aws_instance" "Web-Server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.subnet_1.id
  vpc_security_group_ids = [aws_security_group.instance_types.id]
  user_data              = data.template_file.instance_setup.rendered
 
  tags = {
    Name      = var.Name
  }
}

