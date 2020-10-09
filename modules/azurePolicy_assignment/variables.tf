
variable "policy_set_definition_id" {
  description = "The scope to assign Azure Policies to (ResourceGroup, Subscription, ManagementGroup)"
}

variable "policy_assignment_scope" {
  description = "The scope to assign Azure Policies to (ResourceGroup, Subscription, ManagementGroup)"
}

# All required parameters for policy definitions within the policy set definition

variable "allowedRegions" {
  description = "allowed locations for virtual machine provisioning"
}


variable "listOfAllowedSKUs" {
  description = "allowed SKUs for Virtual Machines"
}
variable "listOfResourceTypes" {
  description = " describe your variable"
   default     = ""
}
# variable "allowedLocation" {
#   type = string
#   description = "(optional) describe your variable"
# }