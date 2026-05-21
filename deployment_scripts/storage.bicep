


param storageAccountNames array = [
  'strgfnrp01'
  'strgfnrp02'
  'strgfnrp03'
]

resource storageAccounts 'Microsoft.Storage/storageAccounts@2023-01-01' = [for name in storageAccountNames: {
  name: name
  location: resourceGroup().location
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
    
  
]
