 
variable "mgmtGroupName" {
  description = "Mgmt group to use for the scope of creating the Policy Set"
}

# All required parameters for policy definitions and set definition
variable "allowedRegions" {
  description = "allowed locations for virtual machine provisioning"
}

variable "listOfAllowedSKUs" {
  description = "allowed SKUs for Virtual Machines"
}

variable "listOfResourceTypes" {
  description = "allowed SKUs for Virtual Machines"
}

