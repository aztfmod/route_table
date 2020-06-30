variable "tags" {
  description = "(Required) tags for the route table object"
}

variable "route_table" {
   description = "(Required) route table object to be created"
 
}

variable next_hop_in_dynamic_private_ip {
   description = "(Optional) dynamically passing private ip address which is an output of another tf resource or module, e.g. azure firewall"
   default = null
}