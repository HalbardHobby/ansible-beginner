terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_default_subnet" "default_az" {
  availability_zone = "us-east-2a"
}

resource "aws_default_security_group" "default_group" {
  vpc_id = "vpc-0f7b8c64be4ebecc6"

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "allow_all" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_default_security_group.default_group.id
}

resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file("${var.public_key_path}")
}

resource "aws_instance" "ec2_instance" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"

  subnet_id                   = aws_default_subnet.default_az.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids      = [aws_default_security_group.default_group.id]

  provisioner "remote-exec" {
    inline = ["echo 'Hello World'"]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${var.private_key_path}")
      host        = aws_instance.ec2_instance.public_dns
    }
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i '${aws_instance.ec2_instance.public_dns},' --private-key ${var.private_key_path} ../ec2.yaml"
  }
}
