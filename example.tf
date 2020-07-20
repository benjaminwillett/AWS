provider "aws" {
  profile = "default"
  region  = "ap-southeast-2"
}

resource "aws_instance" "server1" {
  ami           = "ami-020d764f9372da231"
  instance_type = "t2.micro"

provisioner "local-exec" {
    command = "echo ${aws_instance.server1.public_ip} > ip_address.txt"
}
}

resource "aws_instance" "server2" {
  ami           = "ami-020d764f9372da231"
  instance_type = "t2.micro"

provisioner "local-exec" {
    command = "echo ${aws_instance.server2.public_ip} > ip_address.txt"
}
}
output "server1_ip" {
  value = aws_instance.server1.public_ip
}

output "server2_ip" {
  value = aws_instance.server2.public_ip
}
