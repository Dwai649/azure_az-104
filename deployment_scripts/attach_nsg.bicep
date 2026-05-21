resource nsg 'Microsoft.Network/networkSecurityGroups@2025-05-01' existing ={name: 'nic-web-wus-01'}

resource vnet 'Microsoft.Network/virtualNetworks@2025-05-01' existing ={name: 'vnet-web-usw-01'}




resource subnet1 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
  name: 'sub-vnet-web-usw-01-01'
  parent: vnet
  properties: {
    addressPrefix: '10.0.0.0/24'
    networkSecurityGroup: {
      
      id: nsg.id
    }

  }
}

resource subnet2 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' = {
  name: 'sub-vnet-web-usw-01-02'
  parent: vnet
  properties: {
    addressPrefix: '10.0.1.0/24'
    networkSecurityGroup: {
      
      id: nsg.id
    }

  }
}








