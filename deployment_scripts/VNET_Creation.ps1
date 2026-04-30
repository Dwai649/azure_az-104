$VNET_Name = "VNET-AZ-WRH-00"
$ResourceGroupName = "RG-AZ104-DEV-01"
$location = "eastus"
$addressspace = "10.0.0.0/16"

az network vnet create --name $VNET_Name --resource-group $ResourceGroupName --location $location --address-prefixes $addressspace

