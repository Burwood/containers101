variable "credentials" {}
variable "project" {}
variable "region" {
  default="us-central1"
}

variable "zone" {
  default="us-central1-a"
}

variable "username" {
  default="kubeadmin"
}

variable "password" {}


variable "version" {
  description = "The kubernetes version to use"
  default = "1.11.5-gke.5"
}

variable "prefix" {
  description = "The prefix to use when building resources"
  default = "containers101"
}

variable "machine_type" {
  description = "Instance machine type"
  default = "n1-standard-2"
}

variable "disk_size_gb" {
  description = "Instance disk size"
  default = "50"
}

variable "min_node_count" {
  description = "autoscaling: min nodes"
  default = "1"
}

variable "max_node_count" {
  description = "autoscaling: max nodes"
  default = "5"
}

variable "additional_zones" {
  type = "list"
  description = "Do we want this to be a multi zone cluster?"
  default = ["us-central1-b", "us-central1-c"]
}

# These are the scopes that the node pools run under
variable "gke_node_scopes" {
  type = "list"
    description = "The GKE node scopes"

  default = [
    "https://www.googleapis.com/auth/compute",
    "https://www.googleapis.com/auth/devstorage.read_write",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring",
  ]
}
