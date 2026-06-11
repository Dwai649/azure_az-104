param location string
param vnet object
param linuxvmconifg object


module stgvnet 'modules/network_01_vnet_subnet.bicep' ={
  name:'vnet2'
  params:{ 
    name:vnet.name
    location:location
    addressPrefixes:vnet.addressPrefixes
    subnets:vnet.subnets



  }



}


