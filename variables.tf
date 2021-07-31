variable "instance_type" {
  type = string
  default = "t3.micro"
}


variable "associate_public_ip_address" {
  type = bool
  default = false
}
variable "cpu_credits" {
  type = string
  default = "unlimited"
}
variable "ebs_optimized" {
  type = bool
  default = true
}
variable "get_password_data" {
  type = bool
  default = false
}
variable "iam_instance_profile" {
  type = string
  default = null
}
variable "key_name" {
  type = string
}
variable "source_dest_check" {
  type = bool
  default = true
}
variable "subnet_id" {
  type = string
}
variable "tags" {
  type = map(string)
  default = {

  }
}

variable "user_data" {
  type = map(any)
  default = {}
}

variable "volume_tags" {
  type = map(string)
  default = {

  }
}


variable "vpc_security_group_ids" {
  type = list(string)
  default = null
}

variable "project_name" {

}
variable "owner" {

}

variable "instance_name" {

  default = null
}
variable "ami_id" {
  default = null
}