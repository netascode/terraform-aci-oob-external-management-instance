output "dn" {
  value       = aci_rest.mgmtInstP.id
  description = "Distinguished name of `mgmtInstP` object."
}

output "name" {
  value       = aci_rest.mgmtInstP.content.name
  description = "OOB external management instance name."
}
