resource "aws_instance" "jenkins_demo" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = aws_subnet.main-public-1.id

  # the security group
  vpc_security_group_ids = [aws_security_group.allow-http.id]

  # the public SSH key
  key_name = aws_key_pair.mykeypair.key_name

  tags {
    Name = "Jenkins Demo"
  }

}
