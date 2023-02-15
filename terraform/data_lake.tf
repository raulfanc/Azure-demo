# Resouce Group
resource "azurerm_resource_group" "wsp_demo_RG" {
  name     = "wsp_demo_RG"
  location = "east US"
}

# # Storage Account (Data lake)NFS 3.0 has to be enabled for Logic app to access
# resource "azurerm_storage_account" "datalakegen2wsp123" {
#   name                     = "datalakegen2wsp123"
#   resource_group_name      = azurerm_resource_group.wsp_demo_RG.name
#   location                 = azurerm_resource_group.wsp_demo_RG.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   account_kind             = "StorageV2"
#   is_hns_enabled           = "true"
# }

# resource "azurerm_storage_data_lake_gen2_filesystem" "datalakegen2wsp123" {
#   name                = "datalakegen2wsp123"
#   storage_account_id  = azurerm_storage_account.datalakegen2wsp123.id
#   properties = {
#     "Microsoft.Storage.DataLakeStore.Nfs.Enabled" = "True"
#     "Microsoft.Storage.DataLakeStore.Nfs.Version" = "3.0"
#   }
# }

#Event Hubs Namespace
resource "azurerm_eventhub_namespace" "wspdemonamespace1" {
  name                = "wspdemonamespace1"
  location            = azurerm_resource_group.wsp_demo_RG.location
  resource_group_name = azurerm_resource_group.wsp_demo_RG.name
  sku                 = "Basic"
  capacity            = 1
  zone_redundant      = false
  
  tags = {}
}

#event_hub
resource "azurerm_eventhub" "eventhub_wsp_demo" {
  name                = "eventhub_wsp_demo1"
  namespace_name      = azurerm_eventhub_namespace.wspdemonamespace1.name
  resource_group_name = "wsp_demo_RG"
  partition_count     = 2
  message_retention   = 1
}
