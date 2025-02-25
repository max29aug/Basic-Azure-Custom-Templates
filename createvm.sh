#!/bin/bash

az vm create \
--resource-group resourcegroup_name \
--name vm_name \
--vnet-name vnet_name \
--subnet subnet_name \
--image Ubuntu2204 \
--admin-username azureuser \
--custom-data cloud-init.txt \
--admin-password azureuser@1234 \
--size Standard_B2S \
--storage-sku Standard_LRS
