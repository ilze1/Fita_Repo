provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "public_instance" {
  ami                         = "ami-0f8e81a3da6e2510a"
  instance_type               = var.instance_type
  vpc_security_group_ids      = [var.public_sec_group]
  subnet_id                   = var.subnet_id
  key_name                    = "Fita_test_group1"
  associate_public_ip_address = true
  user_data                   = file("init.sh")


  tags = merge(var.tags, {
    Name = "Private instance EC2"
  })
}
