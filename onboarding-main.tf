# Pulling list of subscriptions from Azure
data "azurerm_subscriptions" "available" {}

# Creating the Azure environments on CloduGuard
resource "dome9_cloudaccount_azure" "connect-azure-subscription" {
  for_each = {for subscription in toset(data.azurerm_subscriptions.available.subscriptions) : subscription.subscription_id => subscription }

  operation_mode         = "Read"
  tenant_id              = var.azure-tenant
  client_id              = var.azure-client-id
  client_password        = var.azure-client-secret
  name                   = each.value.display_name
  subscription_id        = each.value.subscription_id
}
