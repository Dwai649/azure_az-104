param location string

param vmSize  string 

param vmName string = 'CXDVDAP01LZ1'



param adminUserName string = 'azureadmin'

param adminPassword string 

param nicName string = 'vmub-nic-01-wus'

/*param vmName string 
*/

param subnetId string








resource nics 'Microsoft.Network/networkInterfaces@2025-05-01' = {


  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      
      {name: 'ipconfig-01'
       properties: {
        privateIPAllocationMethod: 'Dynamic'
        subnet: {
          id: subnetId

        }
     




       } 
    
    
    }
    ]


  }



}



resource vms 'Microsoft.Compute/virtualMachines@2025-11-01' = {

  name:vmName
  location: location
  properties: {

    hardwareProfile: {
      
      vmSize: vmSize


    }
    osProfile: {
      
      computerName: vmName
      adminUsername: adminUserName
      adminPassword: adminPassword 
    }
     storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'ubuntu-24_04-lts'   
        sku: 'server'
        version: 'latest'
      }

       osDisk: {
       
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
    
    networkProfile: {

      networkInterfaces: [
        {
        id: nics.id 
        properties: {primary: true}
        }
      ]


    }
    


  }


}

