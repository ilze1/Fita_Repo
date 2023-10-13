provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "Public_instance" {
  ami                    = "ami-0f8e81a3da6e2510a"
  instance_type          = var.instance_type
  vpc_security_group_ids = [var.private_sec_group]
  subnet_id              = var.subnet_id
  key_name               = "Fita_test_group1"
  user_data              = file("init.sh")

  tags = merge(var.tags, {
    Name = "Public instance EC2"
  })
}