[![Build status](https://dev.azure.com/azure-terraform/Blueprints/_apis/build/status/modules/route_table)](https://dev.azure.com/azure-terraform/Blueprints/_build/latest?definitionId=14)
# Deploys a route table and routing table entries
Creates a routing table object and a set of routing table entries. 
The route object is not linked to any subnet, you need to attach using azurerm_subnet_route_table_association
as per https://www.terraform.io/docs/providers/azurerm/r/subnet_route_table_association.html

Reference the module to a specific version (recommended):
```hcl
module "route_table" {
    source                  = "git://github.com/aztfmod/route_table.git?ref=v0.1"
  
    route_table                       = var.route_table
    tags                              = var.tags
}
```

Or get the latest version
```hcl
module "route_table" {
    source                  = "git://github.com/aztfmod/route_table.git?ref=latest"
  
    route_table                       = var.route_table
    tags                              = var.tags
}
```

# Parameters
## route_table
(Required) The routing table object describing the route table configuration
Mandatory properties are:
- name
- location
- rg
- at least one route_entries item as follow: 
```hcl
  re1= {
            name                        = "myroute1"
            prefix                      = "255.0.0.0/8"
            next_hop_type               = "None"
            next_hop_in_ip_address      = "192.168.10.5" #required if next_hop_type is "VirtualAppliance"

          },
```

Optional properties are:
- disable_bgp_route_propagation

```hcl
variable "route_table" {
   description = "(Required) route table object to be created"
 
}
```
Example
```hcl
route_table = {
  name = "route_test"
  rg = "uqvh-HUB-CORE-NET"
  location = "southeastasia"
  disable_bgp_route_propagation = false #optional

  route_entries = {
    re1= {
          name                        = "myroute1"
          prefix                      = "255.0.0.0/8"
          next_hop_type               = "None"
        },
    re2= {
          name                        = "myroute2"
          prefix                      = "255.255.0.0/16"
          next_hop_type               = "VirtualAppliance"
          next_hop_in_ip_address      = "192.168.10.5" #required if next_hop_type is "VirtualAppliance"
     },
    re3= {
          name                        = "defaulroute"
          prefix                      = "0.0.0.0/0"
          next_hop_type               = "VirtualAppliance"
          next_hop_in_ip_address      = "192.168.10.5" #required if next_hop_type is "VirtualAppliance"
     },
  }
}
```


## tags
(Required) Map of tags for the deployment
```hcl
variable "tags" {
  description = "(Required) map of tags for the deployment"
}
```
Example
```hcl
tags = {
    environment     = "DEV"
    owner           = "Arnaud"
    deploymentType  = "Terraform"
  }
```

# Output
## object
Returns the resource object of the created route table.
```hcl
output "object" {
  value = azurerm_route_table.route_table
}

```

## name
Returns the resource name of the created route table.
```hcl
output "name" {
  value = azurerm_route_table.route_table.name
}

```

## id
Returns the resource ID of the created route table.
```hcl
output "id" {
  value = azurerm_route_table.route_table.id
}
```

## subnets
Returns the list of subnets where the routing table is attaced.
```hcl
output "subnets" {
  value = azurerm_route_table.route_table.subnets
}
```
