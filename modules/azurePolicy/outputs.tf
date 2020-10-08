
output "policy_definition_regions_id" {
  value = "${azurerm_policy_definition.regions.id}"
}

# output "policy_definition_services_id" {
#   value = "${azurerm_policy_definition.services.id}"
# }

output "policy_set_definition_1_id" {
  value = "${azurerm_policy_set_definition.policy-set-1.id}"
}

