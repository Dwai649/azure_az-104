
param name string = 'vnetpeer_to_bastion' 

param location string 

param vnetname1 string

param vnetname2 string

resource 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2025-07-01' = {
  
  name: name
  location: location
  properties:{ 
    



  }
  


}
