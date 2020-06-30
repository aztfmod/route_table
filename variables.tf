variable "tags" {
  description = "(Required) map of tags for the deployment"
}

variable "convention" {
  description = "(Required) Naming convention method to use"
  type        = string
}

variable "prefix" {
  description = "(Optional) You can use a prefix to the name of the resource"
  type        = string
  default     = ""
}

variable "postfix" {
  description = "(Optional) You can use a postfix to the name of the resource"
  type        = string
  default     = ""
}

variable "max_length" {
  description = "(Optional) You can speficy a maximum length to the name of the resource"
  type        = string
  default     = "60"
}

variable "route_table" {
  description = "(Required) route table object to be created"
}

variable next_hop_in_dynamic_private_ip {
  description = "(Optional) dynamically passing private ip address which is an output of another tf resource or module, e.g. azure firewall"
  type        = string
  default     = null
}

variable resource_group_name {
  description = "(Required) Name of the resource group where to create the resource"
}

variable location {
  description = "(Requires) Location where to create the resource"
}