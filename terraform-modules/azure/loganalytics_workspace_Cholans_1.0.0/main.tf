resource "azurerm_log_analytics_workspace" "loganalytics_workspace" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = try(var.sku_name, "PerGB2018")
  retention_in_days   = try(var.retention_days, 30)
}