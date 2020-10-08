
# Policy Definitions and Definition Sets needs to be created at the Tenant Root management group scope level
# Policy Assignments can then be assigned to the Root Management group level, or lower level scopes
  # Management groups, Subscriptions, Resource Groups, Resources
# tfsp requires AAD Global Admin Role

## Prd Mgmt Group - Prd Tenant
module "azurePolicy_prd_mgmt_group_prd_tenant" {
  source = "../modules/azurePolicy"
  allowedRegions    = var.allowed_Regions
  listOfAllowedSKUs = var.allowed_VM_SKUs
  mgmtGroupName     = data.azurerm_management_group.prd.name
}

# ## Staging Mgmt Group - Prd Tenant
# module "azurePolicy_staging_mgmt_group_prd_tenant" {
#   source = "../modules/azurePolicy"
#   project_ident     = var.project_ident
#   env_ident         = var.env_ident
#   allowedRegions    = var.allowed_Regions
#   allowedServices   = var.allowed_Services
#   listOfAllowedSKUs = var.allowed_VM_SKUs
#   mgmtGroupName     = data.azurerm_management_group.stg.name      
# }

# ##   Prd Tenant
# module "azurePolicy_prd_tenant" {
#   source = "../modules/azurePolicy"
#   project_ident   = var.project_ident
#   env_ident       = var.env_ident
#   allowedRegions  = var.allowed_Regions
#   allowedServices = var.allowed_Services
#   listOfAllowedSKUs = var.allowed_VM_SKUs
#   mgmtGroupName   = var.prd_tenant_root_mgmt_group_name
# }

module "azurePolicy_assignment_prd_mgmt_group_prd_tenant" {
  source = "../modules/azurePolicy_assignment"
  policy_set_definition_id = module.azurePolicy_prd_mgmt_group_prd_tenant.policy_set_definition_1_id
  allowedRegions  = var.allowed_Regions
  listOfAllowedSKUs = var.allowed_VM_SKUs
  policy_assignment_scope = data.azurerm_management_group.prd.name
}

# module "azurePolicy_assignment_staging_mgmt_group_prd_tenant" {
#   source = "../modules/azurePolicy_assignments"
#   project_ident   = var.project_ident
#   env_ident       = var.env_ident
#   # reference the outputs id for the policy_set_definition_id from the module output
#   policy_set_definition_id = module.azurePolicy_staging_mgmt_group_prd_tenant.policy_set_definition_1_id
#   allowedRegions  = var.allowed_Regions
#   allowedServices = var.allowed_Services
#   listOfAllowedSKUs = var.allowed_VM_SKUs
#   policy_assignment_scope = data.azurerm_management_group.stg.id
# }

# module "azurePolicy_assignment_sd_controlled_mgmt_group" {
#   providers = {
#     azurerm = "azurerm.dev-tenant"
#   }
#   project_ident   = var.project_ident
#   env_ident       = var.env_ident
#   source = "../modules/azurePolicy_assignments"
#   policy_set_definition_id = module.azurePolicy_dev_tenant.policy_set_definition_1_id
#   allowedRegions  = var.allowed_Regions
#   allowedServices = var.allowed_Services
#   policy_assignment_scope = data.azurerm_management_group.sb-controlled.id
# }
#  */