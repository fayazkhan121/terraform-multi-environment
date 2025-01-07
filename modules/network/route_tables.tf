# Public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.environment_name}-public-rt"
  }
}

# Route to the Internet Gateway
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}

# Associate all public subnets with the public route table
resource "aws_route_table_association" "public_association" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private route table(s)
resource "aws_route_table" "private" {
  count = length(aws_subnet.private)
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.environment_name}-private-rt-${count.index}"
  }
}

# NAT route for each private route table
resource "aws_route" "private_nat_route" {
  count = length(aws_subnet.private)
  route_table_id         = aws_route_table.private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = length(aws_nat_gateway.this) > 0 ? element(aws_nat_gateway.this.*.id, 0) : null
  # If you want 1 NAT GW per AZ, you'd do something else like match indexes, etc.
  depends_on = [aws_nat_gateway.this]
}

# Associate each private subnet with the private RT
resource "aws_route_table_association" "private_association" {
  count     = length(aws_subnet.private)
  subnet_id = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}
