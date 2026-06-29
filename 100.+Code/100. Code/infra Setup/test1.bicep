param location string
param vnet object

param nsg object


var nsgassociation = [
  {  
    vnetName: vnet.name
    subnetName: vnet.subnets[0].name
    addressprefix: vnet.subnets[0].prefix
  }
  { 
    vnetName: vnet.name
    subnetName: vnet.subnets[1].name
    addressprefix: vnet.subnets[1].prefix
  }
]

module devnet 'modules/network_01_vnet_subnet.bicep' = {
  name: 'dev-network'
  params: {
    name: vnet.name
    location: location  
    addressPrefixes: vnet.addressPrefixes
    subnets: vnet.subnets
  }
}

module networksecuritygroup 'modules/nsg.bicep' ={ 
  
  name: 'nsg-dev-wus'
  params: {
  location: location
  name: nsg.name
  rules: nsg.rules
  association: nsgassociation
  }
dependsOn:[devnet]

}
