provider "aws" {
  region = "us-west-1"
}

resource "aws_subnet" "public_sub" {
  vpc_id     = var.vpc_id
  cidr_block = "172.31.150.0/24"

  tags = merge(var.tags, {
    Name = "Public subnet"
  })
}

resource "aws_subnet" "private_sub" {
  vpc_id     = var.vpc_id
  cidr_block = "172.31.100.0/24"

  tags = merge(var.tags, {
    Name = "Private subnet"
  })
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
    from_port   = 8081
    to_port     = 8081
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

  tags = merge(var.tags, {
    Name = "public_sec_group"
  })
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

  tags = merge(var.tags, {
    Name = "private_sec_group"
  })
}