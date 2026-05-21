resource pip 'Microsoft.Network/publicIPAddresses@2025-05-01' = {
  name: 'pip-web-wus-01'
  location: resourceGroup().location
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}
