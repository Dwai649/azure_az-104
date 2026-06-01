param location string
param vnet object
param storageAccountName string

param nsg object

module devnet 'modules/network_01_vnet_subnet.bicep' = {
  name: 'dev-network'
  params: {
    name: vnet.name
    location: location  
    addressPrefixes: vnet.addressPrefixes
    subnets: vnet.subnets
  }
}

module storage 'modules/storage_01.bicep' = { 
  name: 'storage'
  params: {
    name: storageAccountName
    location: location
  }
}


module networksecuritygroup 'modules/nsg.bicep' ={ 
  
  name: 'nsg-dev-wus'
  params: {
  location: location
  name: nsg.name
  rules: nsg.rules
  }


}
