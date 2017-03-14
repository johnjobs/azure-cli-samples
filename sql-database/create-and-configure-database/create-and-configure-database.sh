#!/bin/bash

# Set an admin login and password for your database
adminlogin=ServerAdmin
password=ChangeYourAdminPassword1
# The logical server name has to be unique in the system
servername=server-$RANDOM
# The ip address range that you want to allow to access your DB
startip=0.0.0.0
endip=255.255.255.255

# Create a resource group
az group create \
	--name myResourceGroup \
	--location westeurope

# Create a logical server in the resource group
az sql server create \
	--name $servername \
	--resource-group myResourceGroup \
	--location northcentralus \
	--admin-user $adminlogin \
	--admin-password $password

# Configure a firewall rule for the server
az sql server firewall-rule create \
	--resource-group myResourceGroup \
	--server $servername \
	-n AllowYourIp \
	--start-ip-address $startip \
	--end-ip-address $endip

# Create a database in the server
az sql db create \
	--resource-group myResourceGroup \
	--server $servername \
	--name mySampleDatabase \
	--service-objective S0

