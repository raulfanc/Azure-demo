# Create Resouce Group named "wsp_demo_RG"
resource "azurerm_resource_group" "wsp_demo_RG" {
  name     = "wsp_demo_RG"
  location = "east US"
}

# Create storage account (Data lake) named "datalakegen2"
resource "azurerm_storage_account" "datalakegen2wsp123" {
  name                     = "datalakegen2wsp123"
  resource_group_name      = azurerm_resource_group.wsp_demo_RG.name
  location                 = azurerm_resource_group.wsp_demo_RG.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalakegen2wsp123" {
  name                = "datalakegen2wsp123"
  storage_account_id  = azurerm_storage_account.datalakegen2wsp123.id
}