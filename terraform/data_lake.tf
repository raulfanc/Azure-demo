# Resouce Group
resource "azurerm_resource_group" "wsp_demo_RG" {
  name     = "wsp_demo_RG"
  location = "east US"
}

# Storage Account (Data lake)
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

  network_rule {
    action = "Allow"
    virtual_network_subnet_id = "<subnet_id>"
  }

  properties = {
    "Microsoft.Storage.DataLakeStore.Nfs.Enabled" = "True"
    "Microsoft.Storage.DataLakeStore.Nfs.Version" = "3.0"
  } # NFS 3.0 has to be enabled for Logic app to access
}

# Event Hubs 
resource "azurerm_resource_group" "wsp_demo_RG" {
  name     = "wsp_demo_RG"
  location = "East US"
}

resource "azurerm_eventhub_namespace" "eventhub-wsp-demo" {
  name                = "eventhub-wsp-demo"
  location            = azurerm_resource_group.wsp_demo_RG.location
  resource_group_name = azurerm_resource_group.wsp_demo_RG.name

  sku {
    name = "Standard"
    tier = "Free"  #1GB free monthly
  }
}

resource "azurerm_eventhub" "eventhub-wsp-demo" {
  name                = "eventhub-wsp-demo"
  namespace_name      = azurerm_eventhub_namespace.eventhub-wsp-demo.name
  resource_group_name = azurerm_resource_group.eventhub-wsp-demo.name

  partition_count = 2
}
