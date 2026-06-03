param location string

param vmSize  string 

param adminUserName string = 'azureadmin'

param adminPassword string 

/*param vmName string 
*/
param count int 
param subnetId string
var index = [for i in range(1,count): i]

param basename string 

var vmNames = [for i in index: 'vm-${basename}-${i}']
var nicNames = [for i in index: 'nic-${basename}-${i}']



resource nics 'Microsoft.Network/networkInterfaces@2025-05-01' = [ for (nicName,i) in nicNames:{


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
]


resource vms 'Microsoft.Compute/virtualMachines@2025-11-01' = [for (vmName,i) in vmNames:{

  name:vmName
  location: location
  properties: {

    hardwareProfile: {
      
      vmSize: 'Standard_B2ms'


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
        id: nics[i].id 
        properties: {primary: true}
        }
      ]


    }
    


  }


}
]
