resource "aws_vpc" "main" {

  cidr_block           = "172.16.0.0/16"

  enable_dns_support   = true

  enable_dns_hostnames = true

 

  tags = {

    Name = "hackathon-vpc"

  }

}

 

resource "aws_subnet" "hackathon-public" {

  vpc_id            = aws_vpc.main.id

  cidr_block        = "172.16.0.0/24"

  availability_zone = "us-east-1a"

 

  tags = {

    Name = "public-subnet"

  }

}

 

resource "aws_subnet" "hackathon-private" {

  vpc_id            = aws_vpc.main.id

  cidr_block        = "172.16.1.0/24"

  availability_zone = "us-east-1b"

 

  tags = {

    Name = "private-subnet"

  }

}

 

resource "aws_internet_gateway" "hackathon-gw" {

  vpc_id = aws_vpc.main.id

 

  tags = {

    Name = "hackathon-igw"

  }

}

 

 

resource "aws_route_table" "myroute" {

  vpc_id = aws_vpc.main.id

 

  route {

    cidr_block = "10.0.1.0/24"

    gateway_id = aws_internet_gateway.hackathon-gw.id

  }

 

  tags = {

    Name = "example"

  }

}

 

resource "aws_security_group" "hackathon-sg" {

  vpc_id = aws_vpc.main.id

 

  ingress {

    from_port   = 80

    to_port     = 80

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

    Name = "hackathon-sg"

  }

}
