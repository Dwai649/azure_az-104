


param name string

param location string




resource storageAccounts 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: name 
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    // Disable public network access
    publicNetworkAccess: 'Disabled'
    allowBlobPublicAccess: false
        }
      }
    
  

