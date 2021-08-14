terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name = "INST1"
}

data "aci_rest" "mgmtInstP" {
  dn = "uni/tn-mgmt/extmgmt-default/instp-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "mgmtInstP" {
  component = "mgmtInstP"

  equal "name" {
    description = "name"
    got         = data.aci_rest.mgmtInstP.content.name
    want        = module.main.name
  }
}
