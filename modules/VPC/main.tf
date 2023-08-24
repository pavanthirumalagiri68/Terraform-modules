#Create VPC

resource "aws_vpc" "vpc" {
    cidr_block =  var.vpc_cidr   
    instance_tenancy = "default"

    tags = {
      Name = "${var.project_name}-${var.Environment}-vpc"
    }
}

#Create Internet-gateway and attach it VPC

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id

  tags = {
      Name = "${var.project_name}-${var.Environment}-igw"
    }
}

#Create route table and add route to public subnet
  
#Use data_source to get the all the availability zones in region

data "aws_availability_zones" "available_zones" {}

#Create Public subnets

resource "aws_subnet" "pub-sub-1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.pub_sub_az1-cidr
    availability_zone       = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.project_name}-${var.Environment}-pub_sub_az1-cidr"
  
  }
}



resource "aws_subnet" "pub-sub-2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.pub_sub_az2-cidr
    availability_zone       = data.aws_availability_zones.available_zones.names[1]
    map_public_ip_on_launch = true

    tags = {
        Name = "${var.project_name}-${var.Environment}-pub_sub_az2-cidr"
  
  }
}

#Create route table and add route to public subnet

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
    tags = {
        Name = "${var.project_name}-${var.Environment}-pub_rt"
  }
  }

#associate public az1 subnet to public route table

resource "aws_route_table_association" "pub-az1" {
  subnet_id      = aws_subnet.pub-sub-1.id
  route_table_id = aws_route_table.public-route-table.id
}

#associate public az1 subnet to public route table

resource "aws_route_table_association" "pub-az2" {
  subnet_id      = aws_subnet.pub-sub-2.id
  route_table_id = aws_route_table.public-route-table.id
}

# Create private app subnets

resource "aws_subnet" "private-app-sub-az1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.private_app_sub_az1-cidr
    availability_zone       = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.project_name}-${var.Environment}-private_app_sub1"
  
  }
}


resource "aws_subnet" "private-app-sub-az2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.private_app_sub_az2-cidr
    availability_zone       = data.aws_availability_zones.available_zones.names[1]
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.project_name}-${var.Environment}-private_app_sub2"
  
  }
}

# Create data subnets

resource "aws_subnet" "private-data-sub-az1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.private_data_sub_az1-cidr
    availability_zone       = data.aws_availability_zones.available_zones.names[0]
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.project_name}-${var.Environment}-private_data_sub1"
  
  }
}


resource "aws_subnet" "private-data-sub-az2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = var.private_data_sub_az2-cidr
    availability_zone       = data.aws_availability_zones.available_zones.names[1]
    map_public_ip_on_launch = false

    tags = {
        Name = "${var.project_name}-${var.Environment}-private_data_sub2"
  }
}