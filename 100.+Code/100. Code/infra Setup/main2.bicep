param location string
param vnet object
param linuxvmconfig object
param linuxvmpassword string




module stgvnet 'modules/network_01_vnet_subnet.bicep' ={
  name:'vnet2'
  params:{ 
    name:vnet.name
    location:location
    addressPrefixes:vnet.addressPrefixes
    subnets:vnet.subnets



  }



}

module vmubn 'modules/computeVM_ubuntu.bicep' ={ 
  name: 'vm_linux'
  params:{ 
    location:location
    vmSize:linuxvmconfig.vmSize
    adminPassword: linuxvmpassword
    subnetId:stgvnet.outputs.subnetIds[0].id 

  }

}


