resource nic_card 'Microsoft.Network/networkInterfaces@2025-05-01' existing ={name: 'nic-web-wus-01'}

resource storageaccount 'Microsoft.Storage/storageAccounts@2023-01-01' existing ={name: 'strgfnrp01'}

var bootDiagBlobEndpoint = storageaccount.properties.primaryEndpoints.blob

resource virtualmachines 'Microsoft.Compute/virtualMachines@2025-11-01' = { 

  name: 'vm-us-web-01'
  location: resourceGroup().location
  properties: {
    hardwareProfile: {vmSize: 'Standard_D2alds_v6'}
      

    
    osProfile: {
      computerName: 'vm-us-web-01'
      adminUsername: 'linuxadmin'
      adminPassword: 'Azure@123'
      linuxConfiguration: {
        disablePasswordAuthentication: false
      }
    }
    

      storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'ubuntu-24_04-lts'   
        sku: 'server'
        version: 'latest'
      }

       osDisk: {
        name: 'osdisk-vm-us-web-01'
        caching: 'ReadWrite'
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'Standard_LRS'
        }
      }
    }
     networkProfile: { 
       networkInterfaces: [ {
        id: nic_card.id
       }]
    }

     diagnosticsProfile: { 
      bootDiagnostics: {
        enabled:true
        storageUri:bootDiagBlobEndpoint
      }




  } 


}

}
