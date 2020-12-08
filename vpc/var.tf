variable "cidr" {
  description = "cidr block for vpc "
  type = string
}


variable "enable_dns_hostnames" {
  description = "dns hostname for vpc"
  default = "true"
  
}

variable "enable_dns_support" {
  type = bool
  default = "true"
  
}

variable "enable_classiclink" {
  type = bool
  default = "false"
  
}

variable "enable_classiclink_dns_support" {
  type = bool
  default = "false"
  
}

variable "name" {
  description = "resource name"
  
}

variable "tags" {
  type = map (string)
  default = {
    
  }

  
}

variable "create_vpc" {
  description = "deploy new vpc"
  type = bool
  default = true
  
}


variable "create_igw" {
  description = "create new igw"
  type = bool
  default = true
  
}


variable "public_subnets" {
  description = "to create poublic subnet for igw"
  type = list (string)
  default = []

  
}

variable "azs" {
  description = "availability zone"
  type = list (string)
  
}


variable "map_public_ip_on_launch" {
  description = "assign public ip for ec2 instance"
  type = bool
  default = true
}


variable "private_subnets" {
  description = "create private subnet"
  type = list (string)
  default = []
  
}

variable "public_subnet_suffix" {
description = "Suffix to append to public subnets name"
default = "public"
}


variable "private_subnet_suffix" {
  description = "suffix to append to private subnets name"
  default = "private"
  
}


  

