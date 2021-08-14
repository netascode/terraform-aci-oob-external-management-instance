resource "aci_rest" "mgmtInstP" {
  dn         = "uni/tn-mgmt/extmgmt-default/instp-${var.name}"
  class_name = "mgmtInstP"
  content = {
    name = var.name
  }
}

resource "aci_rest" "mgmtSubnet" {
  for_each   = toset(var.subnets)
  dn         = "${aci_rest.mgmtInstP.id}/subnet-[${each.value}]"
  class_name = "mgmtSubnet"
  content = {
    ip = each.value
  }
}

resource "aci_rest" "mgmtRsOoBCons" {
  for_each   = toset(var.oob_contracts.consumers != null ? var.oob_contracts.consumers : [])
  dn         = "${aci_rest.mgmtInstP.id}/rsooBCons-${each.value}"
  class_name = "mgmtRsOoBCons"
  content = {
    tnVzOOBBrCPName = each.value
  }
}
