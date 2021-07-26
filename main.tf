#Create Resource Group
resource "azurerm_resource_group" RG_NAME {
  name     = var.RG_NAME
  location = var.AZURE_LOCATION
}

#Create DB Instance
resource "azurerm_postgresql_server" DB_TYPE {
  depends_on = [
    azurerm_resource_group.RG_NAME
  ]
  name                = var.PG_NAME
  location            = var.AZURE_LOCATION
  resource_group_name = var.RG_NAME

  sku_name = "B_Gen5_2"

  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true

  administrator_login          = var.DB_USER
  administrator_login_password = var.DB_PASS
  version                      = "10"
  ssl_enforcement_enabled      = true

}

#Create DataBase
resource "azurerm_postgresql_database" DB_NAME {
  depends_on = [
    azurerm_resource_group.RG_NAME
  ]
  name                = var.DB_NAME
  resource_group_name = var.RG_NAME
  server_name         = azurerm_postgresql_server.DB_TYPE.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

#Create FW access rule - for test only - not for production
resource "azurerm_postgresql_firewall_rule" "global_access" {
  depends_on = [
    azurerm_resource_group.RG_NAME
  ]
  name                = "global_access"
  resource_group_name = var.RG_NAME
  server_name         = azurerm_postgresql_server.DB_TYPE.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}

#Create service plan - due azure limitation, terraform cannot create FREE plan
resource "azurerm_app_service_plan" APP_PLAN {
  name                = var.APP_PLAN
  location            = var.AZURE_LOCATION
  resource_group_name = var.RG_NAME
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Basic"
    size = "B1"
  }
}

#Create APP service
resource "azurerm_app_service" APP_SERVICE {
  name                = var.APP_SERVICE
  location            = var.AZURE_LOCATION
  resource_group_name = var.RG_NAME
  app_service_plan_id = azurerm_app_service_plan.APP_PLAN.id
  https_only = true
  
  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|requarks/wiki:2.5.170"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://hub.docker.com/"
    "DB_TYPE"                             = var.DB_TYPE
    "DB_HOST"                             = azurerm_postgresql_server.DB_TYPE.fqdn
    "DB_PORT"                             = var.DB_PORT
    "DB_NAME"                             = var.DB_NAME
    "DB_USER"                             = "${var.DB_USER}@${var.PG_NAME}"
    "DB_PASS"                             = var.DB_PASS
    "DB_SSL"                              = var.DB_SSL
  }
}