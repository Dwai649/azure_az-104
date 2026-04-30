$VNET_Name = "VNET-AZ-WRH-00"
$ResourceGroupName = "RG-AZ104-DEV-01"
$location = "eastus"
$PublicipName = "PUB-IP-WEB03"
$subnetname = "SNET-WEB-03"
$nic_name = "NIC-WEB03"


az network nic create `
--resource-group $ResourceGroupName `
--location $location `
--name $nic_name `
--vnet-name $VNET_Name `
--subnet $subnetname `
--public-ip-address $PublicipName