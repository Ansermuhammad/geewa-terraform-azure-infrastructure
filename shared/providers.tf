provider "azurerm" {
  version = "~> 2.49.0" #"~> 2.2.0"
  features {}
}

provider "azurerm" {
  alias    = "hub"
  version = "~> 2.49.0" #"~> 2.2.0"
  features {}
}