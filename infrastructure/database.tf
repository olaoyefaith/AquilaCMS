
 # Create a Cosmos DB Account to manage Mongo Database

# resource "azurerm_cosmosdb_account" "acc" {

#   name                      = "dbacccount"
#   location                  = azurerm_resource_group.rg.location
#   resource_group_name       = azurerm_resource_group.rg.name
#   offer_type                = "Standard"
#   kind                      = "MongoDB"
#   is_virtual_network_filter_enabled = "true"
#   enable_automatic_failover = true

#   capabilities {
#     name = "EnableMongo"
#   }

#   consistency_policy {
#     consistency_level       = "BoundedStaleness"
#     max_interval_in_seconds = 400
#     max_staleness_prefix    = 200000
#   }

#   geo_location {
#     location          = "westeurope"
#     failover_priority = 1
#   }

#   geo_location {
#     location          = "canadacentral"
#     failover_priority = 0
#   }
  
#   virtual_network_rule  {
#     id                = azurerm_subnet.be-subnet.id
#     ignore_missing_vnet_service_endpoint = true
#   }
# }

# resource "azurerm_cosmosdb_mongo_database" "mongodb" {
#   name                = "cosmosmongodb"
#   resource_group_name = azurerm_cosmosdb_account.acc.resource_group_name
#   account_name        = azurerm_cosmosdb_account.acc.name
#   throughput          = 400
# }
# # Manages a Mongo Collection within a Cosmos DB Account
# resource "azurerm_cosmosdb_mongo_collection" "coll" {
#   name                = "cosmosmongodbcollection"
#   resource_group_name = azurerm_cosmosdb_account.acc.resource_group_name
#   account_name        = azurerm_cosmosdb_account.acc.name
#   database_name       = azurerm_cosmosdb_mongo_database.mongodb.name

#   default_ttl_seconds = "777"
#   shard_key           = "uniqueKey"
#   throughput          = 400

#   index {
#     keys   = ["_id"]
#     unique = true
#   }
  

#   depends_on = [azurerm_cosmosdb_mongo_database.mongodb]


# }

# #Create Key Vault Secret
# resource "azurerm_key_vault_secret" "mongopassword" {
#   # checkov:skip=CKV_AZURE_41:Expiration not needed 
#   name         = "mongoadmin"
#   value        = random_password.randompassword.result
#   key_vault_id = azurerm_key_vault.fg-keyvault.id
#   content_type = "text/plain"
#   depends_on = [
#     azurerm_key_vault.fg-keyvault,azurerm_key_vault_access_policy.kv_access_policy_01,azurerm_key_vault_access_policy.kv_access_policy_02,azurerm_key_vault_access_policy.kv_access_policy_03
#   ]
# }

#Azure sql database
# resource "azurerm_mssql_server" "azuresql" {
#   name                         = "fg-sqldb-prod"
#   resource_group_name          = azurerm_resource_group.rg.name
#   location                     = azurerm_resource_group.rg.location
#   version                      = "12.0"
#   administrator_login          = "4adminu$er"
#   administrator_login_password = random_password.randompassword.result

#   azuread_administrator {
#     login_username = "AzureAD Admin"
#     object_id      = "86f50fc0-0d0d-4c26-941d-17dd64ed03a6"
#   }
# }

#add subnet from the backend vnet
#adding a new comment in main branch
# resource "azurerm_mssql_virtual_network_rule" "allow-be" {
#   name      = "be-sql-vnet-rule"
#   server_id = azurerm_mssql_server.azuresql.id
#   subnet_id = azurerm_subnet.be-subnet.id
#   depends_on = [
#     azurerm_mssql_server.azuresql
#   ]
# }

# resource "azurerm_mssql_database" "fg-database" {
#   name           = "fg-db"
#   server_id      = azurerm_mssql_server.azuresql.id
#   collation      = "SQL_Latin1_General_CP1_CI_AS"
#   max_size_gb    = 2
#   read_scale     = false
#   sku_name       = "S0"
#   zone_redundant = false

#   tags = {
#     Application = "Aquila"
#     Env = "Prod"
#   }
# }

# resource "azurerm_key_vault_secret" "sqldb_cnxn" {
#   name = "fgsqldbconstring"
#   value = "Driver={ODBC Driver 18 for SQL Server};Server=tcp:fg-sqldb-prod.database.windows.net,1433;Database=fg-db;Uid=4adminu$er;Pwd=${random_password.randompassword.result};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;"
#   key_vault_id = azurerm_key_vault.fg-keyvault.id
#   depends_on = [
#     azurerm_mssql_database.fg-database,azurerm_key_vault_access_policy.kv_access_policy_01,azurerm_key_vault_access_policy.kv_access_policy_02,azurerm_key_vault_access_policy.kv_access_policy_03
#   ]
# }