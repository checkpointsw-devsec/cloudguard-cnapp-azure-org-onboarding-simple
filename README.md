# CloudGuard CNAPP Azure Tenant Terraform Onboarding - Check Point Only
This Terraform project is intended to be used to onboard an entire Azure Tenant in one shot. What it does is configure, via **Terraform**, an existing CloudGuard CSPM Portal and Azure environment that has multiple subscriptions.      
 
## How to start?
You would need to have a CloudGuard tenant, and you can create one via *Infinity Portal* by clicking the image below:      
[<img src=https://www.checkpoint.com/wp-content/themes/checkpoint-theme-v2/images/checkpoint-logo.png>](https://portal.checkpoint.com/create-account)

## Get API credentials in your CloudGuard CNAPP Portal
Then you will need to get the API credentials that you will be using with Terraform to onboard the accounts.

![Architectural Design](/zimages/create-cpsm-serviceaccount.jpg)

Remember to copy these two values, you will need to enter them in the *.tfvars* file later on.

## Prerequisite
Before you proceed, if you would like to create all the configuration of Azure and CloudGuard CNAP Platform with Terraform, please check the full version of this onboarding at [gbrembati / cloudguard-cnapp-azure-org-onboarding](https://github.com/gbrembati/cloudguard-cnapp-azure-org-onboarding).    

You would need to create the Azure configuration first, so please follow the steps described at [CloudGuard Administration Guide - Onboarding Azure to CloudGuard
](https://sc1.checkpoint.com/documents/CloudGuard_Dome9/Documentation/Getting-Started/Onboarding-Azure.htm?tocpath=Getting%20Started%20with%20CloudGuard%20%7COnboarding%20Cloud%20Environments%20%7COnboarding%20Azure%20Subscriptions%20%7C_____1). We would then use the information from the App Registration created both to read the available subscriptions and onboard the accounts to Check Point CNAP Platform.    

## How to use it
The only thing that you need to do is change the __*terraform.tfvars*__ file located in this directory.

```hcl
# Set in this file your deployment variables
azure-client-id     = "xxxxx-xxxxx-xxxxx-xxxxx"
azure-client-secret = "xxxxx-xxxxx-xxxxx-xxxxx"
azure-subscription  = "xxxxx-xxxxx-xxxxx-xxxxx"
azure-tenant        = "xxxxx-xxxxx-xxxxx-xxxxx"

cspm-key-id         = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
cspm-key-secret     = "xxxxxxxxxxxxxxxxxxxx"

chkp-account-region = "Europe"     // Use either Europe / America or Australia
```
If you want (or need) to further customize other project details, you can change defaults in the different __*name-variables.tf*__ files. Here you will also be able to find the descriptions that explain what each variable is used for.
