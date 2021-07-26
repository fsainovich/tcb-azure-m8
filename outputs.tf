output "server_name" {
  description = "The name of the DB_TYPESQL server"
  value       = azurerm_postgresql_server.DB_TYPE.name
}

output "server_fqdn" {
  description = "The fully qualified domain name (FQDN) of the DB_TYPESQL server"
  value       = azurerm_postgresql_server.DB_TYPE.fqdn
}

output "admin_user" {
  description = "The fully qualified domain name (FQDN) of the DB_TYPESQL server"
  value       = azurerm_postgresql_server.DB_TYPE.administrator_login
}

output "app_url" {
  description = "The fully qualified domain name (FQDN) of app server"
  value       = azurerm_app_service.APP_SERVICE.default_site_hostname
}

