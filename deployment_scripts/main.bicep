param location string = 'CentralIndia'
param adminUsername string = 'azuser'
@secure()
param adminPassword string 
@description('The name of the resource that is unique within a resource group. This name can be used to access the resource.')
param name string = 'ipconfig1'

resource vnet 'Microsoft.Network/virtualNetworks@2023-05-01' = {
  name: 'webvmnet_01'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['172.18.10.0/24']
    }
  }
}
resource subnet01 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: 'websubnet01'
  parent: vnet
  properties: {
    addressPrefix: '172.18.10.0/25'
  }
}

resource subnet02 'Microsoft.Network/virtualNetworks/subnets@2023-05-01' = {
  name: 'websubnet02'
  parent: vnet
  properties: {
    addressPrefix: '172.18.10.128/25'
  }
}


resource nsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'webvm01-nsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowHttp'
        properties: {
          priority: 1001
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '80'
        }
      }
      {
        name: 'AllowSSH'
        properties: {
          priority: 1002
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
  }
}

resource pip 'Microsoft.Network/publicIPAddresses@2023-05-01' = {
  name: 'webvm01-ip'
  location: location
  sku: { name: 'Standard' }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2023-05-01' = {
  name: 'webvm01-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: name
        properties: {
          subnet: {
            id: subnet01.id   // reference to first subnet in vnet
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: pip.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}


resource vm 'Microsoft.Compute/virtualMachines@2023-09-01' = {
  name: 'webvm01'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2ats_v2'
    }
    osProfile: {
      computerName: 'webvm01'
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: [ 
        {
        lun: 0
        name: 'webvm01_data_disk01'
        createOption: 'Empty'
        diskSizeGB: 128

        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}
