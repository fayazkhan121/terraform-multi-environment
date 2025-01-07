# Only create NAT Gateways if enable_nat_gateways is true
resource "aws_eip" "nat" {
  count = var.enable_nat_gateways ? var.nat_eip_count : 0
  vpc   = true
  tags = {
    Name = "${var.environment_name}-nat-eip-${count.index}"
  }
}

resource "aws_nat_gateway" "this" {
  count = var.enable_nat_gateways ? var.nat_eip_count : 0
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = element(aws_subnet.public.*.id, count.index)
  tags = {
    Name = "${var.environment_name}-nat-gw-${count.index}"
  }
  depends_on = [aws_internet_gateway.this] # ensure IGW is created first
}
