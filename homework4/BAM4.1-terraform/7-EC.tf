resource "aws_instance" "BAM4.1-ec2" {
  ami                     = "ami-058cdf62ba6d6cd64" # us-east-2 ami
  instance_type           = "m7i-flex.large"
  security_groups = [aws_security_group.BAM4.1-sg.id]
  subnet_id = aws_subnet.public_a.id
  associate_public_ip_address = true

  user_data = file("user_data.sh")

    tags = {
    Name = "BAM4.1-bash-ec2"
  }
}

resource "aws_instance" "BAM4.1-ec2" {
  ami                     = "ami-083b3f53cbda7e5a4" # us-east-2 ami
  instance_type           = "t3.micro"
  security_groups = [aws_security_group.BAM4.1-sg.id]
  subnet_id = aws_subnet.private_a.id
  associate_public_ip_address = true
}