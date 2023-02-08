## refering to Terraform_setup.md to authenticate thru Azure

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "763c5c4a-0fc9-47a1-919f-3bee41db03a0"  #specify the subscription id
}