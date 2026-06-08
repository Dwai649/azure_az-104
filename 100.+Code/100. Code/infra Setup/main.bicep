param location string
param vnet object
param storageAccountName string

param nsg object

param linuxvmconfig object

param linuxvmpassword string

param bastion object

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
dependsOn:[devnet]

}

module VM 'modules/compute_VM.bicep' ={ 

  name: 'vm_linux'
  params:{ 
    location: location
    basename: linuxvmconfig.basename
    vmSize: linuxvmconfig.vmSize
    count: linuxvmconfig.count 
    subnetId: devnet.outputs.subnetIds[0].id 
    adminPassword: linuxvmpassword


  }

  dependsOn:[networksecuritygroup]





}

module baspip 'modules/public_ip.bicep' ={
  name:'bastionpip'
  params:{
    name:bastion.pipname
    location:location
    sku_name:'Standard' 
    IPAllocationMethod:'Static'
  }

}

module bastionserver 'modules/bastion.bicep' ={ 
  name:'bastionserver'
  params:{ 
    name:bastion.name
    location:location
    subnetId:devnet.outputs.subnetIds[2]
    publicIp:baspip.outputs.id

  }
}
