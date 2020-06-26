variable "tags" {
  description = "(Required) tags for the route table object"
}

variable "route_table" {
   description = "(Required) route table object to be created"
 
}

variable next_hop_in_ip_address {
   description = "(Optional) dynamically passing gateway ip which is output of another terraform resource, e.g. azure firewall private ip"
   default = null
}