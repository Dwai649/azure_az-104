param name_vnet string = 'vnet-web-usw-01'

resource vnet 'Microsoft.Network/virtualNetworks@2025-05-01' ={

 name: name_vnet
 location: resourceGroup().location
 properties: {
  
  addressSpace: {addressPrefixes:['10.0.0.0/16']}
  subnets: [  
    
    {name: concat('sub-',name_vnet,'-01')
    properties: {addressPrefix:'10.0.0.0/24'}
  }
    
    
    {
      name: concat('sub-',name_vnet,'-02')
      properties: {addressPrefix:'10.0.1.0/24'}

    }


  ]
 }



}
