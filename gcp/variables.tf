variable "gcp_project" {
  description = "The GCP project ID"
}

variable "gcp_region" {
  description = "The GCP region"
  default     = "us-central1"
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  default     = "gke-cluster"
}
