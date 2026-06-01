@description('name of the vnet')
param name string
param location string
@description('name of the addressPrefix')
param  addressPrefixes array
@description('the subnets')
param subnets array

resource vnet 'Microsoft.Network/virtualNetworks@2025-05-01' ={

 name: name
 location: location
 properties: {
  
  addressSpace: {addressPrefixes:addressPrefixes}
  subnets: [  
   
    for s in subnets:  {
      name: s.name 
      properties: {
        addressPrefix: s.prefix
      }


    }

  ]
 }



}
