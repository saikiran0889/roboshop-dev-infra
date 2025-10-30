resource "aws_instance" "bastion" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_id
  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-bastion"
    }


  )
} 


resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]
connection {
  type = "ssh"
  user = "ec2-user"
  password = "DevOps321"
  host = aws_instance.mongodb.Private_ip
  
}
  provisioner "remote-exec" {
    inline = [
      "echo hello world"
    ]
  }
}