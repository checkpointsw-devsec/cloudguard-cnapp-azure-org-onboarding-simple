# Pulling list of subscriptions from Azure
data "azurerm_subscriptions" "available" {}

# Creating the Azure environments on CloduGuard
resource "dome9_cloudaccount_azure" "connect-azure-subscription" {
  count = length(data.azurerm_subscriptions.available.subscriptions)

  operation_mode         = "Read"
  tenant_id              = var.azure-tenant
  client_id              = var.azure-client-id
  client_password        = var.azure-client-secret
  name                   = data.azurerm_subscriptions.available.subscriptions[count.index].display_name
  subscription_id        = data.azurerm_subscriptions.available.subscriptions[count.index].subscription_id
}
