variable "cidr" {
    description = "pass cidr block "
    type = string
}

variable "dns_support" {
    description = " pass the value to enable dns_support"
    default = true
}

variable "tags" {
    description = " tags for vpc"
    type = map(string)
    default = {}
}

variable "subnet_cidr" {
     description = "pass the address range"
     type = string
}     

variable "service_name" {
  description = " service name for resource"
  type = string
}

variable "env_name" {
  description = " environment name for resource"
  type = string
}