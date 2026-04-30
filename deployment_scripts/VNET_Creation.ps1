$VNET_Name = "VNET-AZ-WRH-00"
$ResourceGroupName = "RG-AZ104-DEV-01"
$location = "eastus"
$addressspace = "10.0.0.0/16"

# Create VNet
az network vnet create `
  --name $VNET_Name `
  --resource-group $ResourceGroupName `
  --location $location `
  --address-prefixes $addressspace

# Define subnets (name prefix pairs)
$subnet1 = "SNET-APP-00"
$subnet1_addressprefix = "10.0.1.0/24"
$subnet2 = "SNET-DB-01"
$subnet2_addressprefix = "10.0.2.0/24"
$subnet3 = "SNET-WEB-03"
$subnet3_addressprefix = "10.0.3.0/24"

az network vnet subnet create `
  --resource-group $ResourceGroupName `
  --vnet-name $VNET_Name `
  --name $subnet1 `
  --address-prefixes $subnet1_addressprefix

az network vnet subnet create `
  --resource-group $ResourceGroupName `
  --vnet-name $VNET_Name `
  --name $subnet2 `
  --address-prefixes $subnet2_addressprefix

az network vnet subnet create `
  --resource-group $ResourceGroupName `
  --vnet-name $VNET_Name `
  --name $subnet3 `
  --address-prefixes $subnet3_addressprefix