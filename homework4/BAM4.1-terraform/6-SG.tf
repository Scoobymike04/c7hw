resource "aws_security_group" "BAM4.1-sg" {
  name        = "BAM4.1-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "Latina-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "BAM4.1-sg-ssh" {
  description       = "SSH"  
  security_group_id = aws_security_group.BAM4.1-sg.1.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

    tags = {
      Name = "SSH"
    }
}

resource "aws_vpc_security_group_ingress_rule" "BAM4.1-sg-http" {
  description       = "Http"  
  security_group_id = aws_security_group.BAM4.1-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

    tags = {
      Name = "HTTP"
    }
}

resource "aws_vpc_security_group_egress_rule" "BAM4.1-sg-allow-all-traffic-ipv4" {
  security_group_id = aws_security_group.BAM4.1-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

