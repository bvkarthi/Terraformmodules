variable "cidr" {
  description = "cidr block for vpc "
  type = string
}

variable "instance_tenancy" {
  description = "Teanancy value"
  default = "shared"
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

variable "vpc_id" {
  description = "Name of the VPC"
  
}

variable "public_subnets" {
  type = list (string)
  default = []

  
}



  

