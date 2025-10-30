resource "aws_instance" "mongodb" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.mongodb_sg_id]
  subnet_id = local.database_subnet_ids
  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-mongodb"
    }


  )
} 

resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.i-09e1307fc2cc33dfe
  ]
connection {
  type = "ssh"
  user = "ec2-user"
  password = "DevOps321"
  host = aws_instance.mongodb.Private_ip
  
}
provisioner "file" {
  source = "bootstrap.sh"  
  destination = "/tmp/bootstrap.sh"
}

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh"
    ]
  }
}
