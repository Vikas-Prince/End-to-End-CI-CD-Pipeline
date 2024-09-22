
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


#Creating a New Security rule
resource "aws_security_group" "terraSecuritygp" {
  name = "newSecurityGroup"
  description = "Creating New Security Group for this VPC"
  vpc_id = aws_vpc.myVpc.id

  dynamic ingress {
    for_each = var.allowedPort
    content {
      from_port   = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  ingress {
    from_port = 30000
    to_port = 32767
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags ={
    Name = "MySecurityGroup"
  }
}


# Launching an EC2 Instance
resource "aws_instance" "ec2"{
    ami = data.aws_ami.latest-ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.vpcSubnet.id
    vpc_security_group_ids = [aws_security_group.terraSecuritygp.id]
    key_name = data.aws_key_pair.my_key
    count = 2

    tags = {
        Name = "K8s Cluster"
    }

}

# Creating Dynamic Inventory File for Ansible
# Creating Dynamic Inventory File for Ansible
resource "null_resource" "ansibleInventory" {
  triggers = {
    myTriggers = timestamp()
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo "[k8s Master]" > inventory
      echo "${aws_instance.ec2[0].public_ip} ansible_user=ec2-user ansible_ssh_private_key_file="${key_path}"" >> inventory
      echo "[k8s slave]" >> inventory
      # If you don't have `web` instances, remove this block
      # for ip in ${join(" ", aws_instance.ec2[*].public_ip)}; do
      #   if [ "$ip" != "${aws_instance.ec2[0].public_ip}" ]; then
      #     echo "$ip ansible_user=ec2-user ansible_ssh_private_key_file=${key_path}" >> inventory
      #   fi
      # done
    EOT
  }
}
