
 #Create a Cosmos DB Account to manage Mongo Database

resource "azurerm_cosmosdb_account" "acc" {

  name                      = "dbacccount"
  location                  = azurerm_resource_group.rg.location
  resource_group_name       = azurerm_resource_group.rg.name
  offer_type                = "Standard"
  kind                      = "MongoDB"
  enable_automatic_failover = true

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 400
    max_staleness_prefix    = 200000
  }

  geo_location {
    location          = "westeurope"
    failover_priority = 1
  }

  geo_location {
    location          = "canadacentral"
    failover_priority = 0
  }
  
}

resource "azurerm_cosmosdb_mongo_database" "mongodb" {
  name                = "cosmosmongodb"
  resource_group_name = azurerm_cosmosdb_account.acc.resource_group_name
  account_name        = azurerm_cosmosdb_account.acc.name
  throughput          = 400
}


output "cosmosdb_connectionstrings" {
   value = azurerm_cosmosdb_account.acc.connection_strings
   sensitive   = true
}
output "AZURE_COSMOS_DATABASE_NAME" {
  value = azurerm_cosmosdb_mongo_database.mongodb.name
}



