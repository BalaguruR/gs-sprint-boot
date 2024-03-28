terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.95.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = "terraform.tfstate"

    client_id       = ""
    client_secret   = ""
    tenant_id       = ""
    subscription_id = ""
  }
}

provider "azurerm" {
    features{}
    # credentials to talk to Azure Cloud
    client_id       = ""
    client_secret   = ""
    tenant_id       = ""
    subscription_id = ""
}

resource "azurerm_resource_group" "example2" {
  name = "myrg00002"
  location ="South India"
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            =  azurerm_resource_group.example2.location
  resource_group_name =  azurerm_resource_group.example2.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }
  
  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }
}

