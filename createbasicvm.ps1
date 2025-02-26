# Description: Create a basic VM in Azure
# Small VM for testing purposes for sandboxes or small workloads
# Please change the region, resource group, VM name, VNet, Subnet, Public IP, NSG, and other parameters as needed
# Usage: ./createbasicvm.ps1
New-AzVM -resourceGroupName "resourcegroup_name" -Name "vm_name" -Location "EastUS" -Image "MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest" -Size "Standard_B2S" -VirtualNetworkName "vnet1" -SubnetName "subnet1" -PublicIpAddressName "vm_PublicIp" -OpenPorts 3389 -SecurityGroupName "vm_NSG"