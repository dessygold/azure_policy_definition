
# 24 character 'Policy Assignment' Name Limit

resource "azurerm_policy_set_definition" "policy-set-1" {
  name         = "goldpolicy-sec-controls"
  policy_type  = "Custom"
  display_name = "goldpolicy-sec-controls"
  management_group_name = var.mgmtGroupName

  parameters = <<PARAMETERS
    {
    "allowedRegions": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "allowed regions",
        "strongType": "location"
      }
    },
    "listOfAllowedSKUs": {
      "type": "Array",
      "metadata": {
        "description": "The list of size SKUs that can be specified for virtual machines.",
        "displayName": "allowed vm skus",
        "strongType": "VMSKUs"
      }
    },
    "listOfResourceTypes": {
      "type": "Array",
      "metadata": {
        "description": "Audit diagnostic setting for selected resource types.",
        "displayName": "Resource Types",
        "strongType": "resourceTypes"
      }
    }
}
PARAMETERS


# # Custom: Allowed Regions (Locations)
#   policy_definition_reference {
#     policy_definition_id = azurerm_policy_definition.regions.id
#     parameters = {
#         allowedRegions = "[parameters('allowedRegions')]"
#     }
#   }

# Custom: Allowed Regions (Locations)
  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.regions.id
    parameters = {
        allowedRegions = "[parameters('allowedRegions')]"
    }
  }

# }
#     parameters = {
#         allowedRegions = "[parameters('allowedRegions')]"
#     }
#   }

# # Custom: Allowed Services (ResourceTypes)
#   policy_definition_reference {
#     policy_definition_id = azurerm_policy_definition.services.id
#     parameters = {
#         allowedServices = "[parameters('allowedServices')]"
#     }
#   }

# Built-In: Show audit results from Windows VMs that do not have the password complexity setting enabled
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/f48b2913-1dc5-4834-8c72-ccc1dfd819bb"
  }

# Built-In: Allowed virtual machine size (SKUs)
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"
    parameters = {
        listOfAllowedSKUs = "[parameters('listOfAllowedSKUs')]"
    }
  }

  # Built-In: A maximum of 3 owners should be designated for your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/4f11b553-d42e-4e3a-89be-32ca364cad4c"
  }
  # Built-In: Access through Internet facing endpoint should be restricted
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/9daedab3-fb2d-461e-b861-71790eead4f6"
  }
  # Built-In: Adaptive application controls for defining safe applications should be enabled on your machines
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/47a6b606-51aa-4496-8bb7-64b11cf66adc"
  }
  # Built-In: Internet-facing virtual machines should be protected with network security groups
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/f6de0be7-9a8a-4b8a-b349-43cf02d22f7c"
  }
  # Built-In : Add system-assigned managed identity to enable Guest Configuration assignments on virtual machines with no identities
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/3cf2ab00-13f1-4d0c-8971-2ac904541a7e"
  }
  # Built-In: Add system-assigned managed identity to enable Guest Configuration assignments on VMs with a user-assigned identity
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/497dff13-db2a-4c0f-8603-28fa3b331ab6"
  }
  # Built-In: Advanced data security should be enabled on your SQL servers
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/abfb4388-5bf4-4ad7-ba82-2cd2f41ceae9"
  }
  # Built-In: Advanced data security should be enabled on SQL Managed Instance
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/abfb7388-5bf4-4ad7-ba99-2cd2f41cebb9"
  }
  # Built-In: An Azure Active Directory administrator should be provisioned for SQL servers
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/1f314764-cb73-4fc9-b863-8eca98ac36e9"
  }
  # Built-In (Deny): API App should only be accessible over HTTPS
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/b7ddfbdc-1260-477d-91fd-98bd9be789a6"
  }
  # Built-In (listofresourcetype parameter): Audit diagnostic setting
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/7f89b1eb-583c-429a-8828-af049802c1d9"
    parameters = {
        listOfResourceTypes = "[parameters('listOfResourceTypes')]"
    }
  }

  # Built-In: Audit Linux machines that allow remote connections from accounts without passwords
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/ea53dbee-c6c9-4f0e-9f9e-de0039b78023"
  }
  # Built-In: Audit Linux machines that do not have the passwd file permissions set to 0644
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/e6955644-301c-44b5-a4c4-528577de6861"
  }
  # Built-In: Audit Linux machines that have accounts without passwords
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/f6ec09a3-78bf-4f8f-99dc-6c77182d0f99"
  }
  # Built-In( In Preview): Audit Log Analytics Agent Deployment - VM Image (OS) unlisted
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/32133ab0-ee4b-4b44-98d6-042180979d50"
  }
  # # Built-In (logAnalytics parameters): Deploy Log Analytics agent for Windows virtual machine scale sets
  # policy_definition_reference {
  #   policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/3c1b3629-c8f8-4bf6-862c-037cb9094038"
  # }

  # # Built-In (log Analytics parameters): Audit Log Analytics workspace for VM - Report Mismatch
  # policy_definition_reference {
  #   policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/f47b5582-33ec-4c5c-87c0-b010a6b2e917"
  # }

  # Built-In: Audit usage of custom RBAC rules
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/a451c1ef-c6ca-483d-87ed-f49761e3ffb5"
  }
  # Built-In: Audit virtual machines without disaster recovery configured
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/0015ea4d-51ff-4ce3-8d8c-f3f8f0179a56"
  }
  # # Built-In (MembersToInclude): Audit Windows machines missing any of specified members in the Administrators group
  # policy_definition_reference {
  #   policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/30f71ea1-ac77-4f26-9fc5-2d926bbd4ba7"
  # }

  # Built-In: Audit Windows machines that allow re-use of the previous 24 passwords
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/5b054a0d-39e2-4d53-bea3-9734cad2c69b"
  }

  # Built-In: Audit Windows machines that do not have a maximum password age of 70 days
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/4ceb8dc2-559c-478b-a15b-733fbf1e3738"
  }
  # Built-In: Audit Windows machines that do not have a minimum password age of 1 day
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/237b38db-ca4d-4259-9e47-7882441ca2c0"
  }
  # Built-In (copy maybe): Audit Windows machines that do not have the password complexity setting enabled
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/bf16e0bb-31e1-4646-8202-60a235cc7e74"
  }
  # Built-In: Audit Windows machines that do not restrict the minimum password length to 14 characters
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/a2d0e922-65d0-40c4-8f87-ea6da2d307a2"
  }
  # Built-In : Audit Windows machines that do not store passwords using reversible encryption
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/da0f98fe-a24b-4ad5-af69-bd0400233661"
  }
  # # Built-In (MembersToInclude): Audit Windows machines that have the specified members in the Administrators group
  # policy_definition_reference {
  #   policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/69bf4abd-ca1e-4cf6-8b5a-762d42e61d4f"
  # }

  # Built-In: Audit Windows web servers that are not using secure communication protocols
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/5752e6d6-1206-46d8-8ab1-ecc2f71a8112"
  }
  # Built-In: Auditing on SQL server should be enabled
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/a6fb4358-5bf4-4ad7-ba82-2cd2f41ce5e9"
  }
  # Built-In: Azure DDoS Protection Standard should be enabled
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/a7aca53f-2ed4-4466-a25e-0b45ade68efd"
  }
  # Built-In: CORS should not allow every resource to access your Web Applications
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/5744710e-cc2f-4ee8-8809-3b11e89f4bc9"
  }
  # Built-In: Deploy the Linux Guest Configuration extension to enable Guest Configuration assignments on Linux VMs
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/331e8ea8-378a-410f-a2e5-ae22f38bb0da"
  }
  # Built-In: Deploy the Windows Guest Configuration extension to enable Guest Configuration assignments on Windows VMs
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/385f5831-96d4-41db-9a3c-cd3af78aaae6"
  }
  # Built-In: Deprecated accounts should be removed from your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/6b1cbf55-e8b6-442f-ba4c-7246b6381474"
  }
  # Built-In: Deprecated accounts with owner permissions should be removed from your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/ebb62a0c-3560-49e1-89ed-27e074e9f8ad"
  }
  # Built-In: Disk encryption should be applied on virtual machines
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/0961003e-5a0a-4549-abde-af6a37f2724d"
  }
  # Built-In: Endpoint protection solution should be installed on virtual machine scale sets
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/26a828e1-e88f-464e-bbb3-c134a282b9de"
  }
  # Built-In: External accounts with owner permissions should be removed from your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/f8456c1c-aa66-4dfb-861a-25d127b775c9"
  }
  # Built-In: External accounts with read permissions should be removed from your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/5f76cf89-fbf2-47fd-a3f4-b891fa780b60"
  }
  # Built-In: External accounts with write permissions should be removed from your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/5c607a2e-c700-4744-8254-d77e7c9eb5e4"
  }
  # Built-In (Deny): Function App should only be accessible over HTTPS
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/6d555dd1-86f2-4f1c-8ed7-5abae7c6cbab"
  }
  # Built-In: Management ports of virtual machines should be protected with just-in-time network access control
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/b0f33259-77d7-4c9e-aac6-3aabcfae693c"
  }
  # Built-In: MFA should be enabled accounts with write permissions on your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/9297c21d-2ed6-4474-b48f-163f75654ce3"
  }
  # Built-In: MFA should be enabled on accounts with owner permissions on your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/aa633080-8b72-40c4-a2d7-d00c03e80bed"
  }
  # Built-In: MFA should be enabled on accounts with read permissions on your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/e3576e28-8b17-4677-84c3-db2990658d64"
  }
  # Built-In: Monitor missing Endpoint Protection in Azure Security Center
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/af6cd1bd-1635-48cb-bde7-5b15693900b9"
  }
  # Built-In: Only secure connections to your Azure Cache for Redis should be enabled
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/22bee202-a82f-4305-9a2a-6d7f44d4dedb"
  }
  # Built-In: Remote debugging should be turned off for API Apps
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/e9c8d085-d9cc-4b17-9cdc-059f1f01f19e"
  }
  # Built-In: Remote debugging should be turned off for Function Apps
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/0e60b895-3786-45da-8377-9c6b4b6ac5f9"
  }
  # Built-In: Remote debugging should be turned off for Web Applications
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/cb510bfd-1cba-4d9f-a230-cb0976f4bb71"
  }
  # Built-In (Deny): Secure transfer to storage accounts should be enabled
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/404c3081-a854-4457-ae30-26a93ef643f9"
  }
  # Built-In: Service Fabric clusters should only use Azure Active Directory for client authentication
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/b54ed75b-3e1a-44ac-a333-05ba39b99ff0"
  }
  # Built-In: Storage accounts should restrict network access using virtual network rules
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/2a1a9cdf-e04d-429a-8416-3bfb72a1b26f"
  }
  # Built-In: System updates on virtual machine scale sets should be installed
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/c3f317a7-a95c-4547-b7e7-11017ebdf2fe"
  }
  # Built-In: System updates should be installed on your machines
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/86b3d65f-7626-441e-b690-81a8b71cff60"
  }
  # Built-In: There should be more than one owner assigned to your subscription
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/09024ccc-0c5f-475e-9457-b7c0d9ed487b"
  }
  # Built-In (Deny): Transparent Data Encryption on SQL databases should be enabled
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/17k78e20-9358-41c9-923c-fb736d382a12"
  }
  # Built-In: Vulnerabilities in security configuration on your machines should be remediated
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/e1e5fd5d-3e4c-4ce1-8661-7d1873ae6b15"
  }
  # Built-In: Vulnerabilities in security configuration on your virtual machine scale sets should be remediated
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/3c735d8a-a4ba-4a3a-b7cf-db7754cf57f4"
  }
  # Built-In: Vulnerabilities on your SQL databases should be remediated
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/feedbf84-6b99-488c-acc2-71c829aa5ffc"
  }
  # Built-In: VVulnerabilities should be remediated by a Vulnerability Assessment solution
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/760a85ff-6162-42b3-8d70-698e268f648c"
  }
  # Built-In: Web Application should only be accessible over HTTPS
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/a4af4a39-4135-47fb-b175-47fbdf85311d"
  }
  
}