[![VScodespaces](https://img.shields.io/endpoint?url=https%3A%2F%2Faka.ms%2Fvso-badge)](https://online.visualstudio.com/environments/new?name=terraform-azurerm-caf-route-table&repo=aztfmod/terraform-azurerm-caf-route-table)

# Deploys a route table and routing table entries

Creates a routing table object and a set of routing table entries.

The route object is not linked to any subnet, you need to attach using azurerm_subnet_route_table_association
as per https://www.terraform.io/docs/providers/azurerm/r/subnet_route_table_association.html

Reference the module to a specific version (recommended):
```hcl
module "route_table" {
  source  = "aztfmod/caf-route-table/azurerm"
  version = "0.x.y"

  prefix     = local.prefix
  tags       = local.tags
  convention = local.convention

  resource_group_name            = azurerm_resource_group.rg_test.name
  location                       = local.location
  route_table                    = local.route_table
  next_hop_in_dynamic_private_ip = local.next_hop_in_dynamic_private_ip
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| convention | (Required) Naming convention method to use | `string` | n/a | yes |
| max\_length | (Optional) You can speficy a maximum length to the name of the resource | `string` | `"60"` | no |
| next\_hop\_in\_dynamic\_private\_ip | (Optional) dynamically passing private ip address which is an output of another tf resource or module, e.g. azure firewall | `any` | `null` | no |
| postfix | (Optional) You can use a postfix to the name of the resource | `string` | `""` | no |
| prefix | (Optional) You can use a prefix to the name of the resource | `string` | `""` | no |
| route\_table | (Required) route table object to be created | `any` | n/a | yes |
| tags | (Required) map of tags for the deployment | `any` | n/a | yes |


## Parameters

## route_table
(Required) The routing table object describing the route table configuration
Mandatory properties are:
- name
- at least one route_entries item as follow:
```hcl
  re1= {
            name                        = "myroute1"
            prefix                      = "255.0.0.0/8"
            next_hop_type               = "None"
            next_hop_in_ip_address      = "192.168.10.5" #required if next_hop_type is "VirtualAppliance"

          },
```
Optional fields:
- disable_bgp_route_propagation

## next_hop_in_dynamic_private_ip
(Optional) String in CIDR format of next hop ip address in route. If parameter 'next_hop_in_dynamic_private_ip' is not passed in to the module, then property 'next_hop_in_ip_address' is mandatory for next_hop_type = "VitualAppliance" in tfvars file as defined above.
If the parameter 'next_hop_in_dynamic_private_ip' is passed in to the module, it has priority over 'next_hop_in_ip_address' in tfvars file and always overrides it.


## Outputs

| Name | Description |
|------|-------------|
| id | Returns the ID of the created route table |
| name | Returns the name of the created route table |
| object | Returns the full object of the created route table |