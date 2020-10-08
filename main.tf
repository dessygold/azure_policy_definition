
provider "azurerm" {
  # environment     = "public"
  # subscription_id = var.subscription_Id
  # tenant_id       = var.tenant_id
  # client_id       = var.tf_sp_appid
  # client_secret   = var.tf_sp_secret
  # version         = "2.20"
  features {
  }
}

data "azurerm_client_config" "current" {
} 

data "azurerm_management_group" "prd" {
  name  = "goldpolicymgmtgp"
}

# data "azurerm_management_group" "prd" {
#   name  = "${var.project_ident}-${var.env_ident}-prd"
# }

# data "azurerm_management_group" "stg" {
#   name = "${var.project_ident}-${var.env_ident}-staging"
# }

# data "azurerm_management_group" "Tenant_Root_Group" {
#   name = "f5cf1236-30f1-46d6-9501-ca5a5bb5a5b8"
# }

# data "azurerm_management_group" "sb-controlled" {
#   name = "${var.project_ident}-${var.env_ident}-sandbox-controlled"
# }
