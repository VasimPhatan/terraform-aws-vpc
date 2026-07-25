data "aws_availability_zones" "available" {
  state = "available"
}


output "az_info" {
  value = data.aws_availability_zones.available
}

data "aws_vpc" "default"{
  default = true
}



data "aws_route_table" "main" {
  vpc_id = data.aws_vpc.default.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}


output "vpc_id" {
  value = aws_vpc.main.id
}


output "public_subnet_id" {
  value = aws_subnet.public[count.index].id
}


output "private_subnet_id" {
  value = aws_subnet.private[count.index].id
}


output "database_subnet_id" {
  value = aws_subnet.database[count.index].id
}





