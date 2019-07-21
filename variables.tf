variable "route_name" {
  description = "(Required) name of the route object to be created"
  
}

variable "location" {
  description = "(Required) location where to deploy the route table object"
}

variable "tags" {
  description = "(Required) tags for the route table object"
}

variable "route_resource_group" {
  description = "(Required) resource group where to deploy the route table object"
  
}

variable "subnet_id" {
  description = "(Required) subnet where the route table object will be created"

}

variable "route_prefix" {
   description = "(Required) route prefix for the route table object"
 
}

variable "route_nexthop" {
   description = "(Required) route nexthop for the route table object" 
}

