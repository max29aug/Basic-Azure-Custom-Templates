# Variables
RESOURCE_GROUP="rg_example"
REGION="westeurope"
VNET_NAME="vnet_example"
SUBNET_NAME="subnet_example"
GATEWAY_SUBNET_NAME="GatewaySubnet"
VNET_ADDRESS_PREFIX="10.0.0.0/16"
SUBNET_ADDRESS_PREFIX="10.0.1.0/24"
GATEWAY_SUBNET_PREFIX="10.0.255.0/27"

# Create resource group (if it doesn't exist)
az group create --name $RESOURCE_GROUP --location $REGION

# Create Virtual Network (VNet)
az network vnet create \
  --resource-group $RESOURCE_GROUP \
  --name $VNET_NAME \
  --location $REGION \
  --address-prefix $VNET_ADDRESS_PREFIX

# Create subnet within the VNet
az network vnet subnet create \
  --resource-group $RESOURCE_GROUP \
  --vnet-name $VNET_NAME \
  --name $SUBNET_NAME \
  --address-prefix $SUBNET_ADDRESS_PREFIX

# Create gateway subnet within the VNet
az network vnet subnet create \
  --resource-group $RESOURCE_GROUP \
  --vnet-name $VNET_NAME \
  --name $GATEWAY_SUBNET_NAME \
  --address-prefix $GATEWAY_SUBNET_PREFIX

# Create Network Security Group (NSG)
az network nsg create --resource-group $RESOURCE_GROUP --name myNSG

# Create a VM and associate it with the VNet, Subnet, and NSG
az vm create \
  --resource-group $RESOURCE_GROUP \
  --name vm_vm1 \
  --vnet-name $VNET_NAME \
  --subnet $SUBNET_NAME \
  --image MicrosoftWindowsServer:WindowsServer:2019-Datacenter:latest \
  --admin-username azureuser \
  --admin-password azureuser@1234 \
  --size Standard_B2S \
  --storage-sku Standard_LRS \
  --nsg myNSG