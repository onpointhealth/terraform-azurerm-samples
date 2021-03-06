locals {
  context = {
    application_name = "pstf"
    environment_name = "fn"
    location = "East US"
    location_suffix = "us-east"
  }

module "rg" {
  source  = "github.com/persistentsystems/terraform-azurerm/services/resource-group/base/v1"
  context = local.context
}

module "storage" {
    source = "github.com/persistentsystems/terraform-azurerm/blob/master/services/storage/endpoint/base/v1"
    context = module.rg.context
    service_settings = {
        name = "${local.context.application_name}-${local.context.environment_name}-sample"
        tier = "standard"
        type = "GRS"
    }
}