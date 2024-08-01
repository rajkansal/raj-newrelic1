# Configure terraform
terraform {
  required_version = "~> 1.0"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
    }
  }
}

# Configure the New Relic provider
provider "newrelic" {
  account_id = "4439970"
  api_key = "NRAK-EP6JRY3DSAHSSIQUI3EAWYAV2DI"  # usually prefixed with 'NRAK'
  region = "US"                    # Valid regions are US and EU
}