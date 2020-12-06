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

variable "tags_vpc" {
  type = map (string)
  default = {
    
  }

  
}

variable "create_vpc" {
  type = bool
  default = true
  
}


variable "create_gateway" {
  type = bool
  default = true
  
}

variable "public_subnets" {
  type = list (string)
  default = []

  
}

variable "igw_tags" {
  type = map (string)
  default = {

  }

  
}

variable "create_egress_only_igw" {
  
}