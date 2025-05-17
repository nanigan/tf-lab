az vm list-skus --resource-type "virtualMachines" --all --output table \ --query "[?name=='Standard_NC96ads_A100_v4'].{Name:name, Locations:locations}"

az vm list-skus --resource-type "virtualMachines" --all \ --query "[?contains(name, 'NC') && contains(name, 'A100')].{Name:name, Locations:locations}" \ --output json


az vm list-skus -l "UAE Central" --resource-type "virtualMachines" --all \ --query "[?contains(name, 'NC') && contains(name, 'A100')].{Name:name, Locations:locations}"