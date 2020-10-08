
# # The variables below are common across the solution
variable "allowed_VM_SKUs" {
  description = "allowed regions for virtual machine provisioning"
  default = [
    "Standard_B1s",
    "Standard_B1ms",
    "Standard_B1ls",
    "Standard_B2ms",
    "Standard_B2s",
    "Standard_B4ms",
    "Standard_DS1_v2",
    "Standard_DS2_v3",
    "Standard_DS2_v2",
    "Standard_DS3_v2",
    "Standard_D4s_v3",
    "Standard_D4s_v4",
    "Standard_D8s_v3" 
  ]
}

variable "allowed_Regions" {
  description = "allowed SKUs for Virtual Machines"
  default = [
    "eastus",
    "eastus2",
    "westus",
    "westus2",
    "centralus",
    "global"
  ]
}

#The variables below are specific to this deployment

# variable "prd_tenant_root_mgmt_group_name" {
#   description = "The name of the SE-Azure Prd Tenant's root management group name. The name is the tenant id in this case"
#   default = "f5cf1236-30f1-46d6-9501-ca5a5bb5a5b8"
# }

/* variable "dev_tenant_root_mgmt_group_name" {
  description = "The name of the SE-Azure Prd Tenant's root management group name. The name is the tenant id in this case"
  default = "<dev-tenant-id>"
} */
# variable "allowedLocation" {
#   type = string
#   description = "(optional) describe your variable"
#   default = "eastus",
#     "eastus2",
#     "westus",
#     "westus2"
  
# }

# variable "allowed_Services" {
#   description = "allowed services via the subscription resource providers"
#   type = list
#   default = [
#     "Microsoft.Compute/virtualMachines",
#     "Microsoft.Compute/disks",
#     "Microsoft.Compute/images",
#     "Microsoft.Compute/snapshots",
#     "Microsoft.Compute/restorePointCollections",
#     "Microsoft.Compute/virtualMachines/extensions",
#     "Microsoft.Compute/availabilitySets",
#     "Microsoft.ClassicCompute/domainNames",
#     "Microsoft.RecoveryServices/vaults",
#     "Microsoft.Network/networkInterfaces",
#     "Microsoft.Network/publicIPAddresses",
#     "Microsoft.Network/virtualNetworks",
#     "Microsoft.Network/routeTables",
#     "Microsoft.Network/networkSecurityGroups",
#     "Microsoft.Network/applicationGateways",
#     "Microsoft.Network/bastionHosts",
#     "Microsoft.Network/azureFirewalls",
#     "Microsoft.Network/dnszones",
#     "Microsoft.Network/ddosProtectionPlans",
#     "Microsoft.Network/networkWatchers",
#     "Microsoft.Network/virtualNetworkGateways",
#     "Microsoft.Network/connections",
#     "Microsoft.Network/trafficmanagerprofiles",
#     "Microsoft.Sql/servers",
#     "Microsoft.Sql/servers/databases",
#     "Microsoft.KeyVault/vaults",
#     "Microsoft.Storage/storageAccounts",
#     "Microsoft.StorageSync/storageSyncServices",
#     "Microsoft.Web/sites", 
#     "Microsoft.Web/serverfarms",
#     "Microsoft.OperationalInsights",
#     "Microsoft.OperationalInsights/workspaces", 
#     "Microsoft.Insights",
#     "Microsoft.Insights/components",
#     "Microsoft.Insights/actionGroups",
#     "Microsoft.Insights/activityLogAlerts",
#     "Microsoft.Portal/dashboards",
#     "Microsoft.ContainerInstance",
#     "Microsoft.ContainerInstance/containerGroups",
#     "Microsoft.ContainerRegistry/registries",
#     "Microsoft.Devtestlab/Schedules",
#     "Microsoft.Batch/batchAccounts",
#     "Microsoft.Cdn/profiles",
#     "Microsoft.EventGrid",
#     "Microsoft.EventGrid/topics",
#     "Microsoft.EventHub",
#     "Microsoft.EventHub/namespaces",
#     "Microsoft.NotificationHubs",
#     "Microsoft.NotificationHubs/namespaces",
#     "Microsoft.NotificationHubs/namespaces/notificationHubs"
#   ]
# }

# https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-services-resource-providers
# https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations