resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.90.1.0/24"
  availability_zone       = "us-east-2a" # specify AZ
  map_public_ip_on_launch = true         #allow public IPs to be assigned
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.90.2.0/24"
  availability_zone       = "us-east-2b" # specify AZ
  map_public_ip_on_launch = true         #allow public IPs to be assigned
  tags = {
    Name = "Main"
  }
}


resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.90.3.0/24"
  availability_zone = "us-east-2c" # specify AZ
  tags = {
    Name = "Main"
  }
}


############# Private Subnets #############

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.90.11.0/24"
  availability_zone       = "us-east-2a" # specify AZ
  map_public_ip_on_launch = false
  tags = {
    Name = "Main"
  }
}


resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.90.12.0/24"
  availability_zone       = "us-east-2b" # specify AZ
  map_public_ip_on_launch = false
  tags = {
    Name = "Main"
  }
}


resource "aws_subnet" "private_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.90.13.0/24"
  availability_zone       = "us-east-2c" # specify AZ
  map_public_ip_on_launch = false
  tags = {
    Name = "Main"
  }
}