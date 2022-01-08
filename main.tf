provider "aws" {
  region = var.region
}
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "${var.namespace}-ec2"

  #Instance
  count         = 2
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = "t2.micro"
  tenancy       = "default"

  #Keypair
  key_name = var.key_pair

  #Networking
  associate_public_ip_address = true

  tags = {
    Name = "${var.namespace}-ec2-inst"
  }
}