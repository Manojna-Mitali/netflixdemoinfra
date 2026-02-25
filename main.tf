provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-0b6c6ebed2801a5cb"
  instance_type          = "c7i-flex.large"
  key_name               = "majorproject"
  vpc_security_group_ids = ["sg-0f84108a9de2033bf"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
