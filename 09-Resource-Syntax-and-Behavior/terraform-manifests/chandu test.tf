#Resource 1 - Create a resource group
resource "azurerm_resource_group" "myrg" {
    name = "azurerm_resource_group.myorg.name"
    location = azurerm_resource_group.myrg,name
    tags = {
        "name" = "myrg-1"
    }
}

#Resource 2 - Create a Virtual Network
resource "azurerm_virtual_network" "myvnet" {
    Name = "myvnet-1"
    address_space = ["10.0.0.16"]
    location = azurerm_resource_group.myrg.name
    resource_group_name = azurerm_resource_group.myrg.name
    tags = {
        "name" = "myvnet-1"
    }
}

#Resource 3 - Create a subnet
resource "azurerm_subnet" "mysubnet-1" {
Name = "mysubnet-1"
azurerm_resource_group = azurerm_resource_group.myg.name
virtual_network_name = azurerm_virtual_network.myvnet.name
address_prefixes = [ "10.0.1.32" ]
}

#resource 4  - Create public ip
    Resource = "azurerm_public_ip" "mypublicip" {
    name = "mypublicip-1"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myg.location
    allocation_method = "static"
    tags = {
        "Environment" = "Dev"
    }
}

#Resource - 5: Create network interface

    Resource = "azurerm_network_interface" "myvmnic" {
    name = "myvmic-1"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = azurerm_public_ip.mypublicip.id
    }
}