locals {
  convention       = "cafrandom"
  name             = "caftest-route-table"
  name_la          = "caftestlavalid"
  name_diags       = "caftestdiags"
  location         = "southeastasia"
  prefix           = ""
  postfix          = ""
  max_length       = 60
  enable_event_hub = false
  resource_groups = {
    test = {
      name     = "test-caf-route-table"
      location = "southeastasia"
    },
  }
  tags = {
    environment = "DEV"
    owner       = "CAF"
  }
  next_hop_in_dynamic_private_ip = "192.168.10.6"

  route_table = {
    name = "test_route"
    route_entries = {
      re1 = {
        name          = "myroute1"
        prefix        = "255.0.0.0/8"
        next_hop_type = "None"
      },
      re2 = {
        name                   = "myroute2"
        prefix                 = "255.255.0.0/16"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "192.168.10.6"
      },
      re3 = {
        name                   = "defaultroute"
        prefix                 = "0.0.0.0/0"
        next_hop_type          = "VirtualAppliance"
        next_hop_in_ip_address = "192.168.10.5"
      },
    }
  }

}