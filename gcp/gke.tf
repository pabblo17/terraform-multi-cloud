resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.gcp_region

  node_pool {
    name       = "spot-nodes"
    node_count = 1

    node_config {
      preemptible  = true
      machine_type = "e2-medium"

      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform",
      ]
    }
  }
}
