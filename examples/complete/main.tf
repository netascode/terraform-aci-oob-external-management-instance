module "aci_oob_external_management_instance" {
  source = "netascode/oob-external-management-instance/aci"

  name    = "INST1"
  subnets = ["0.0.0.0/0"]
  oob_contracts = {
    consumers = ["CON1"]
  }
}
