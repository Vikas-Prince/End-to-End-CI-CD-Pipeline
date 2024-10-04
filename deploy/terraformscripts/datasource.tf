data "aws_ami" "latest-ami"{
    most_recent = true

    owners      = ["amazon"]
    filter {
        name = "name"
        values = ["al2023-ami-2023.5.20241001.1-kernel-6.1-x86_64"]
    }

     filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_key_pair" "my_key" {
    key_name = "Ansible"
}