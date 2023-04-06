terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

# Configure the Datadog provider
provider "datadog" {
  api_key = "$DATADOG_API_KEY"
  app_key = "$DATADOG_APP_KEY"
  api_url = "$DATADOG_APP_URL"
}


resource "datadog_monitor" "cpumonitor" {
  name = "cpu monitor"
  type = "metric alert"
  message = "CPU usage alert"
  query = "avg(last_1m):avg:system.cpu.system{*} by {host} > 60"
}
