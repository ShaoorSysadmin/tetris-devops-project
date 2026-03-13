resource "aws_instance" "devops_server" {
  ami           = "ami-123456"
  instance_type = "t3.micro"
}
