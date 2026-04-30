$ResourceGroupName = "RG-AZ104-DEV-01"
$location = "eastus"
$PublicipName = "PUB-IP-WEB03"

az network public-ip create `
--resource-group $ResourceGroupName `
--location $location `
--name $PublicipName `
--sku Standard `
--allocation-method Static `
  --version IPv4