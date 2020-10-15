#建立資源群組ADDS
$resourceGroup = "ADDS"
$location = "East Asia"
$vmName = "ADDS"
New-AzResourceGroup -Name $resourceGroup -Location $location

#建立虛擬網路ADDS-vnet
$virtualNetwork = New-AzVirtualNetwork `
  -ResourceGroupName $resourceGroup `
  -Location $location `
  -Name $vmName-vnet `
  -AddressPrefix 172.16.0.0/16
$subnetadds = Add-AzVirtualNetworkSubnetConfig `
-Name adds-subnet `
-AddressPrefix 172.16.1.0/24 `
-VirtualNetwork $virtualNetwork
$subnethostpool = Add-AzVirtualNetworkSubnetConfig `
-Name rdsh-subnet `
-AddressPrefix 172.16.2.0/24 `
-VirtualNetwork $virtualNetwork
$subnetJump = Add-AzVirtualNetworkSubnetConfig `
-Name AzureBastionSubnet `
-AddressPrefix 172.16.3.0/24 `
-VirtualNetwork $virtualNetwork
$virtualNetwork | Set-AzVirtualNetwork

#建立ADDS VM
$User = "isadmin"
$PWord = ConvertTo-SecureString -String "iadmin@123" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord
#Create a public IP address and specify a DNS name
$virtualNetwork = Get-AzVirtualNetwork -Name $vmName-vnet -ResourceGroupName $resourceGroup 
$pip = New-AzPublicIpAddress -ResourceGroupName $resourceGroup -Location $location `
  -Name $vmName-pip -AllocationMethod Static -Sku Standard
$nic = New-AzNetworkInterface -Name $vmName-nic -ResourceGroupName $resourceGroup -Location $location `
  -SubnetId $virtualNetwork.Subnets[0].Id -PublicIpAddressId $pip.Id
#Create a virtual machine configuration
$vmConfig = New-AzVMConfig -VMName $vmName -VMSize Standard_D2_v3 | `
Set-AzVMOperatingSystem -Windows -ComputerName $vmName -Credential $Credential | `
Set-AzVMSourceImage -PublisherName MicrosoftWindowsServer -Offer WindowsServer -Skus 2019-Datacenter -Version latest | `
Add-AzVMNetworkInterface -Id $nic.Id
# Create a virtual machine
New-AzVM -ResourceGroupName $resourceGroup -Location $location -VM $vmConfig

#建立Bastion
$publicip = New-AzPublicIpAddress `
-ResourceGroupName $resourceGroup `
-name $vmName-Bation-ip `
-location $location `
-AllocationMethod "Static" `
-Sku Standard
New-AzBastion `
-ResourceGroupName $resourceGroup `
-Name $vmName-Bation `
-PublicIpAddress $publicip `
-VirtualNetworkRgName $resourceGroup `
-VirtualNetworkName $vmName-vnet

# Install ADDS
$PublicSettings = '{"commandToExecute":"powershell Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools -Restart"}'

Set-AzVMExtension -ExtensionName "HyperV" -ResourceGroupName $resourceGroup -VMName $vmName `
  -Publisher "Microsoft.Compute" -ExtensionType "CustomScriptExtension" -TypeHandlerVersion 1.4 `
  -SettingString $PublicSettings -Location $location