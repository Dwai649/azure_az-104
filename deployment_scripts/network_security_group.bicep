// Variables
var nsgName = 'nsg-dev-01'
var rulesshName = 'allow-ssh-admin'
var rulesshPriority = 400
var sshPort = '22'
var svcTagInternet = 'Internet'
var httpDestIp = '10.0.0.4'
var httpPort = '80'
var ruleHttpName = 'in-allow-http-from-internet-to-10-0-0-4'
var ruleHttpPriority = 410

// Resource: NSG with rules
resource nsg 'Microsoft.Network/networkSecurityGroups@2025-05-01' = {
  name: nsgName
  location: resourceGroup().location
  properties: {
    securityRules: [
      {
        name: rulesshName
        properties: {
          priority: rulesshPriority
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          sourceAddressPrefix: svcTagInternet
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: sshPort
        }
      }
      {
        name: ruleHttpName
        properties: {
          priority: ruleHttpPriority
          access: 'Allow'
          direction: 'Inbound'
          protocol: 'Tcp'
          sourceAddressPrefix: svcTagInternet
          sourcePortRange: '*'
          destinationAddressPrefix: httpDestIp
          destinationPortRange: httpPort
        }
      }
    ]
  }
}
