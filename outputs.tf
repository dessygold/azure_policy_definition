
output "policy_definition_regions_id_prd_mgmt_group_prd_tenant" {
  value = module.azurePolicy_prd_mgmt_group_prd_tenant.policy_definition_regions_id
}


output "policy_set_definition_1_id_prd_mgmt_group_prd_tenant" {
  value = module.azurePolicy_prd_mgmt_group_prd_tenant.policy_set_definition_1_id
}

output "policy_set-assignment_1_id_prd_mgmt_group_prd_tenant" {
  value = module.azurePolicy_assignment_prd_mgmt_group_prd_tenant.policy_set-assignment-1_id
}

# output "policy_definition_regions_id_dev" {
#   value = module.azurePolicy_dev_tenant.policy_definition_regions_id
# }

# output "policy_definition_services_id_dev" {
#   value = module.azurePolicy_dev_tenant.policy_definition_services_id
# }

# output "policy_set_definition_1_id_dev" {
#   value = module.azurePolicy_dev_tenant.policy_set_definition_1_id
# }

# output "policy_set-assignment-sb-controled_mgmt_group_id" {
#   value = module.azurePolicy_assignment_sd_controlled_mgmt_group.policy_set-assignment-1_id
# }
