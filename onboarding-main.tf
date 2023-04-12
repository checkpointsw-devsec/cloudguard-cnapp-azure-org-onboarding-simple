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

# Notifications to build Continuous Policies
resource "dome9_continuous_compliance_notification" "system-console-alert" {
  name           = "system-console-alert"
  description    = "Notification to create continuous policies"
  alerts_console = true

  change_detection {
    email_sending_state = "Disabled"
  }
}