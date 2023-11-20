#Frontend
# Create the web app, pass in the App Service Plan ID
resource "azurerm_linux_web_app" "fe-webapp" {
  name                  = "Aquila-frontend"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  service_plan_id       = azurerm_service_plan.fe-asp.id
  https_only            = true
  
 site_config { 
    container_registry_use_managed_identity = true
     minimum_tls_version =  "1.2"
    always_on = true
   application_stack{
     
      docker_image = __DOCKER_IMAGE__ 
      docker_image_tag = __DOCKER_IMAGE_TAG__
     }
  }

    
  
   
  app_settings = {

    "APPINSIGHTS_INSTRUMENTATIONKEY"                  = azurerm_application_insights.fg-appinsights.instrumentation_key
    "APPINSIGHTS_PROFILERFEATURE_VERSION"             = "1.0.0"
    "ApplicationInsightsAgent_EXTENSION_VERSION"      = "~2"
     COSMOSDB_URI       = azurerm_cosmosdb_account.acc.endpoint
     COSMOSDB_KEY       = azurerm_cosmosdb_account.acc.primary_key
     COSMOSDB_DATABASE  = azurerm_cosmosdb_mongo_database.mongodb.name
  

  }
  connection_string {
    name  = "MongoDBConnectionString"
    type  = "Custom"
    value =  azurerm_cosmosdb_account.acc.primary_key
}

  
  depends_on = [
    azurerm_service_plan.fe-asp,azurerm_application_insights.fg-appinsights, azurerm_cosmosdb_account.acc,azurerm_cosmosdb_mongo_database.mongodb
  ]
}



#vnet integration of backend functions
resource "azurerm_app_service_virtual_network_swift_connection" "fe-vnet-integration" {
  app_service_id = azurerm_linux_web_app.fe-webapp.id
  subnet_id      = azurerm_subnet.fe-subnet.id

  depends_on = [
    azurerm_linux_web_app.fe-webapp
  ]
}

