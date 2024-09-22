data "aws_ami" "latest-ami"{
    most_recent = true

    filter {
        name = "name"
        values = ["RHEL-9.4.0_HVM-2024*-x86_64-82-Hourly2-GP3"]
    }
}

data "aws_key_pair" "my_key" {
    key_name = "Ansible"
}