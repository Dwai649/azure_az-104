$ResourceGroupName   = "RG-AZ104-DEV-01"
$Location            = "eastus"
$NsgName             = "nsg-az104-shared-eus-01"

$VNetName            = "VNET-AZ-WRH-00"
$SubnetName          = "SNET-WEB-03"

az network nsg create `
--resource-group $ResourceGroupName `
--name $NsgName `
--location $Location

az network nsg rule create `
--resource-group $ResourceGroupName `
--nsg-name $NsgName `
  --name "in-allow-ssh-admin" `
  --priority 400 `
  --access Allow `
  --direction Inbound `
  --protocol Tcp `
  --source-address-prefixes Internet `
  --source-port-ranges "*" `
  --destination-address-prefixes "10.0.3.4" `
  --destination-port-ranges 22

az network nsg rule create `
  --resource-group $ResourceGroupName `
  --nsg-name $NsgName `
  --name "in-allow-http-from-internet-to-10-0-3-4" `
  --priority 410 `
  --access Allow `
  --direction Inbound `
  --protocol Tcp `
  --source-address-prefixes Internet `
  --source-port-ranges "*" `
  --destination-address-prefixes  "10.0.3.4" `
  --destination-port-ranges 80

az network vnet subnet update `
  --resource-group $ResourceGroupName `
  --vnet-name $VNetName `
  --name $SubnetName `
  --network-security-group $NsgName