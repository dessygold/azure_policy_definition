# 24 character 'Policy Assignment' Name Limit

resource "azurerm_policy_assignment" "set-assignment-1" {
  name                 = "goldpolicy-sec-controls" 
  #name                 = "${var.project_ident}-${var.env_ident}-sec-controls" 
  scope                = var.policy_assignment_scope
  description          = "policy set definition assignment to specified management groups"
  display_name         = "goldpolicy-sec-controls"
  policy_definition_id = var.policy_set_definition_id
  identity { type = "SystemAssigned" }
  location             = "eastus"
  parameters = <<PARAMETERS
    {
    "allowedRegions": {
      "value": ${jsonencode(var.allowedRegions)}
    },
    "listOfAllowedSKUs": {
      "value": ${jsonencode(var.listOfAllowedSKUs)}
    },
    "listOfResourceTypes": {
      "value": ${jsonencode(var.listOfResourceTypes)}
    }
}
PARAMETERS
}
