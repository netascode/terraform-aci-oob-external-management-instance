<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-aci-oob-external-management-instance/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-aci-oob-external-management-instance/actions/workflows/test.yml)

# Terraform ACI OOB External Management Instance Module

Manages ACI OOB External Management Instance

Location in GUI:
`Tenants` » `mgmt` » `External Management Network Instance Profiles`

## Examples

```hcl
module "aci_oob_external_management_instance" {
  source = "netascode/oob-external-management-instance/aci"

  name    = "INST1"
  subnets = ["0.0.0.0/0"]
  oob_contracts = {
    consumers = ["CON1"]
  }
}

```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aci"></a> [aci](#requirement\_aci) | >= 0.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aci"></a> [aci](#provider\_aci) | >= 0.2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | OOB external management instance name. | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets | `list(string)` | `[]` | no |
| <a name="input_oob_contracts"></a> [oob\_contracts](#input\_oob\_contracts) | OOB Contracts | <pre>object({<br>    consumers = optional(list(string))<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dn"></a> [dn](#output\_dn) | Distinguished name of `mgmtInstP` object. |
| <a name="output_name"></a> [name](#output\_name) | OOB external management instance name. |

## Resources

| Name | Type |
|------|------|
| [aci_rest.mgmtInstP](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.mgmtRsOoBCons](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
| [aci_rest.mgmtSubnet](https://registry.terraform.io/providers/netascode/aci/latest/docs/resources/rest) | resource |
<!-- END_TF_DOCS -->