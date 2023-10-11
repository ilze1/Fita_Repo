provider "aws" {
  region = "us-west-1"
}

resource "aws_subnet" "public_sub" {
  vpc_id     = "vpc-0f488eb699cfd3961"
  cidr_block = "172.31.150.0/24"

  tags = {
    Name  = "Public"
    Owner = "Gruppa1"
  }
}

resource "aws_subnet" "private_sub" {
  vpc_id     = "vpc-0f488eb699cfd3961"
  cidr_block = "172.31.100.0/24"

  tags = {
    Name  = "Private"
    Owner = "Gruppa1"
  }
}

resource "aws_security_group" "public_sec_group" {
  name = "public_sec_group"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Group_1_sec_pub"
    Owner = "Grupa1"
  }
}

resource "aws_security_group" "private_sec_group" {
  name = "private_sec_group"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "Group_1_sec_private"
    Owner = "Grupa1"
  }
}



resource "aws_instance" "public_instance" {
  ami                         = "ami-0f8e81a3da6e2510a"
  instance_type               = "t2.large"
  vpc_security_group_ids      = [aws_security_group.public_sec_group.id]
  subnet_id                   = aws_subnet.public_sub.id
  key_name                    = "Fita_test_group1"
  associate_public_ip_address = true
  user_data                   = file("init.sh")


  tags = {
    Name  = "Grupa1_pub_instance"
    Owner = "Grupa1"
  }
}

resource "aws_instance" "private_instance" {
  ami                    = "ami-0f8e81a3da6e2510a"
  instance_type          = "t2.large"
  vpc_security_group_ids = [aws_security_group.private_sec_group.id]
  subnet_id              = aws_subnet.private_sub.id
  key_name               = "Fita_test_group1"
  user_data              = file("init.sh")

  tags = {
    Name  = "Grupa1_priv_instance"
    Owner = "Grupa1"
  }
}


