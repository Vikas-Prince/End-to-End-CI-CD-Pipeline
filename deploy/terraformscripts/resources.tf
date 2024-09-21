
# creating a VPC 
resource "aws_vpc" "myVpc" {
    cidr_block = "10.0.0.0/16"

    tags ={
        Name = "Vpc2"
    }
}

# creating a Subnet
resource "aws_subnet" "vpcSubnet" {
    vpc_id = aws_vpc.myVpc.id
    cidr_block = "10.0.1.0/24"

    tags = {
        Name = "vpcSubnet2"
    }
}

# creating a Internet Gateway
resource "aws_internet_gateway" "vpcGateway" {
    vpc_id = aws_vpc.myVpc.id

    tags = {
      Name = "vpcGateway2"
    }
}

# creating Route tables
resource "aws_route_table" "vpcRouteTable" {
    vpc_id = aws_vpc.myVpc.id

    route {
        cidr_block= "0.0.0.0/24"
        gateway_id = aws_internet_gateway.vpcGateway.id
    }

    tags = {
        Name = "vpcRouteTable2"
    }
}


resource "aws_route_table_association" "route-table-ass" {
  subnet_id = aws_subnet.vpcSubnet.id
  route_table_id = aws_route_table.vpcRouteTable.id
}


# Launching an EC2 Instance
resource "aws_instance" "ec2"{
    ami = data.aws_ami.latest-ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.vpcSubnet.id
    vpc_security_group_ids = [data.aws_Security_group.security_group.id]
    key_name = data.aws_key_pair.my_key
    count = 1

    tags = {
        Name = "K8s Cluster"
    }

}