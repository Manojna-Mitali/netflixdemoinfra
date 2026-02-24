provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "c7i-flex.large"
  key_name               = "majorproject"
  vpc_security_group_ids = ["sg-04a0ee6c90761cb68"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
