param name string
param location string
param sku_name string
param IPAllocationMethod string


resource publicip 'Microsoft.Network/publicIPAddresses@2025-05-01' = {
  
  name: name
  location: location
  sku:{name:sku_name}
  properties:{publicIPAllocationMethod:IPAllocationMethod}



}
