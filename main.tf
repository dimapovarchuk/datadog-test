terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

# Configure the Datadog provider
provider "datadog" {
  api_key = "c7c49ce7575c2430180571a89ed113d8"
  app_key = "5e99956aabb34080d395ad5d4315785fdbe19017"
  api_url = "https://api.datadoghq.eu/"
}


resource "datadog_monitor" "cpumonitor" {
  name = "cpu monitor"
  type = "metric alert"
  message = "CPU usage alert"
  query = "avg(last_1m):avg:system.cpu.system{*} by {host} > 60"
}
