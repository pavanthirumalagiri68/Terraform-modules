output "region" {
    value = var.region
}

output "project_name" {
    value = var.project_name
}

output "Environment" {
    value = var.Environment
}

output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "internet_gateway" {
    value = aws_internet_gateway.igw
}


output "pub_sub_az1-cidr" {
    value = aws_subnet.pub-sub-1.id
}

output "pub_sub_az2-cidr" {
    value = aws_subnet.pub-sub-2.id
}

output "private_app_sub_az1-cidr" {
    value = aws_subnet.private-app-sub-az1.id
}

output "private_app_sub_az2-cidr" {
    value = aws_subnet.private-app-sub-az2.id
}

output "private_data_sub_az1-cidr" {
    value = aws_subnet.private-data-sub-az1.id
}

output "private_data_sub_az2-cidr" {
    value = aws_subnet.private-data-sub-az2.id
}

 