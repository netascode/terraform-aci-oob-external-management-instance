terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">=2.0.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "INST1"
}

data "aci_rest_managed" "mgmtInstP" {
  dn = "uni/tn-mgmt/extmgmt-default/instp-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "mgmtInstP" {
  component = "mgmtInstP"

  equal "name" {
    description = "name"
    got         = data.aci_rest_managed.mgmtInstP.content.name
    want        = module.main.name
  }
}
