



$accounts = az storage account list --resource-group RG-AZ104-DEV-01 --query "[?contains(name, 'strgb')].name" -o tsv

foreach ($acct in $accounts) {
    az storage account delete --name $acct --resource-group RG-AZ104-DEV-01 --yes
}

