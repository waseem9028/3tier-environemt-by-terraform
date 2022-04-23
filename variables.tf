variable "av_zone_1" {
  type = map(string)

  default = {
    us-east-1 = "us-east-1a"
    us-east-2 = "us-east-1b"
   }
}

variable "av_zone_2" {
  type = map(string)

  default = {
    eu-west-1      = "eu-west-1b"
    us-east-1      = "us-east-1c"
    us-west-2      = "us-west-2b"
  }
}

# the ami image to use
variable "ami" {
  type = string
  default = "ami-0bcc094591f354be2"
}

# the name of the ssh key
variable "key_name" {
  type = string
  default = "prod"
}

# the instance type of the jump host
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "Name" {
  type = string
  default = "webserver"
}

variable "name" {
    type = string
    default = "appdb"
}

variable "username" {
     type = string
    default = "appadmin"
}
variable "password" {
     type = string
    default = "defined@here"
}