data "aws_ami" "latest-ami"{
    most_recent = true

    filter {
        name = "name"
        values = ["RHEL-9.4.0_HVM-2024*-x86_64-82-Hourly2-GP3"]
    }
}

data "aws_Security_group" "security_group" {
    filter {
        name = "default"
        value = ["sg-044899a8cf48aee4f"]
    }
}

data "aws_key_pair" "my_key" {
    key_name = "myFirstServer"
}