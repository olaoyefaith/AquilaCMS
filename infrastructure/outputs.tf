output "frontend_url" {
  
  value = "${azurerm_linux_web_app.fe-webapp.name}.azurewebsites.net"
}
