resource vnet 'Microsoft.Network/virtualNetworks@2025-05-01' existing ={name: 'vnet-web-usw-01'}


resource subnet 'Microsoft.Network/virtualNetworks/subnets@2025-05-01' existing ={
  name: 'sub-vnet-web-usw-01-01'
  parent: vnet}


resource pip 'Microsoft.Network/publicIPAddresses@2025-05-01' existing ={name: 'pip-web-wus-01'
}



resource nic 'Microsoft.Network/networkInterfaces@2025-05-01' ={name: 'nic-web-wus-01'
location: resourceGroup().location
properties: {

  ipConfigurations: [
    {name: 'ip-configh-we-01'
     properties: {
      privateIPAllocationMethod: 'Dynamic'
      subnet: {
        id: subnet.id
      }
      publicIPAddress: {
        id: pip.id
      }
     }
  
  }
  ]
  



}
}
