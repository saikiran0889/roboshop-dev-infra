variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "sg_name" {
    type = list
    default = [
        "catalogue", "mongodb", "cart", "user", "mysql", 
        "shipping", "payment", "rabbitmq", "frontend",
        "bastion",
        "forntend_alb",
        "backend_alb",
        
        ]

}


