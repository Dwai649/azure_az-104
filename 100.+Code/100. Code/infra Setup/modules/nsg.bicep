
param name string
param location string 
param rules array

param association array


// Resource: NSG with rules
resource nsg 'Microsoft.Network/networkSecurityGroups@2025-05-01' = {
  name: name
  location: location
  properties: {
    securityRules: [
      
      for r in rules: r    

    ]
   
    
  }
}

resource subnetass 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = [

  for a in association:{
   name: '${a.vnetName}/${a.subnetName}'
   properties:{ 
    addressPrefixes: a.addressprefix
    networkSecurityGroup:{
      id:nsg.id
    }
   }
  }



]
