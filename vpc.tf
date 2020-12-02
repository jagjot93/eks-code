resource "aws_vpc" "myvpc" {
  cidr_block = "${var.cidr_range[0]}"

  tags = {
    Name = "vpc"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.myvpc.id
  count      = "${length(var.private_cidr)}"
  cidr_block = "${var.private_cidr[count.index]}"
  availability_zone = "${var.private_subnet_az[count.index]}"

  tags = var.private_subnet_tags
#    Name = "private_subnet",
#    kubernetes.io/cluster/${var.eks_name} = "shared"
#    "kubernetes.io/cluster/test" = "shared"
#  }
}

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.myvpc.id
  count      = "${length(var.public_cidr)}"
  cidr_block = "${var.public_cidr[count.index]}"
  map_public_ip_on_launch = true
  availability_zone = "${var.public_subnet_az[count.index]}"

  tags = var.public_subnet_tags
#    Name = "public_subnet"
#  }
}

resource "aws_eip" "myeip" {
  vpc = true

  tags = {
    Name = "eip"
  }
}

resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.myeip.id
  subnet_id = aws_subnet.public[0].id

  tags = {
    Name = "natgw"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mynat.id
  }

  tags = {
    Name = "private_route_table"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "private" {
  count      = "${length(aws_subnet.private)}"
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private_route_table.id

}

resource "aws_route_table_association" "public" {
  count      = "${length(aws_subnet.public)}"
  subnet_id = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

