
resource "google_container_cluster" "primary" {
  name               = "${var.prefix}"
  #region             = "us-west1"
  zone               = "${var.zone}"
  additional_zones   = "${var.additional_zones}"
  project            = "${var.project}"
  
    # For available versions, go to: gcloud container get-server-config --zone=us-west1-a
  min_master_version = "${var.version}"
  node_version = "${var.version}"
  
  enable_legacy_abac = false

  cluster_ipv4_cidr  = "10.30.0.0/16"

  initial_node_count = 1


  master_auth {
    username = "${var.username}"
    password = "${var.password}"
  }


  maintenance_policy {
    daily_maintenance_window {
      start_time = "02:00"
    }
  }


  lifecycle {
    ignore_changes = ["initial_node_count", "node_config", "addons_config"]
  }


  node_config {
      preemptible = true
      disk_size_gb = "${var.disk_size_gb}"
      machine_type = "${var.machine_type}"
      oauth_scopes = "${var.gke_node_scopes}"
  }

    
  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      # Enable the horizontal pod autoscaler addon so we can do autoscaling
      disabled = false
    }
    kubernetes_dashboard {
      # Run a k8 dashboard
      disabled = false
    }
  }

  timeouts {
    create = "10m"
    delete = "30m"
    update = "2h"
  }
  
}


resource "google_container_node_pool" "pool" {
  name = "${var.prefix}-nodes"
  node_count = "2"
  cluster    = "${google_container_cluster.primary.name}"
  zone       = "${google_container_cluster.primary.zone}"
  project    = "${google_container_cluster.primary.project}"


  lifecycle {
    ignore_changes = ["node_count"]
  }


    autoscaling {
      min_node_count = "${var.min_node_count}"
      max_node_count = "${var.max_node_count}"
    }


    node_config {
      preemptible = true
      disk_size_gb = "${google_container_cluster.primary.node_config.0.disk_size_gb}"
      machine_type = "${google_container_cluster.primary.node_config.0.machine_type}"
      oauth_scopes = ["${google_container_cluster.primary.node_config.0.oauth_scopes}"]
      labels {
        purpose = "default"
      }
    }

  # Delete the default node pool before spinning this one up
  depends_on = ["null_resource.default_cluster_deleter"]
}


resource "null_resource" "default_cluster_deleter" {
  provisioner "local-exec" {
    command = <<EOT
      gcloud --quiet container node-pools delete default-pool \
        --zone ${google_container_cluster.primary.zone} \
        --cluster ${google_container_cluster.primary.name} \
        --project ${var.project}
    EOT
    when = "create"
  }
}


output "cluster_name" {
  value = "${google_container_cluster.primary.name}"
}


output "primary_zone" {
  value = "${google_container_cluster.primary.zone}"
}


output "additional_zones" {
  value = "${google_container_cluster.primary.additional_zones}"
}


output "endpoint" {
  value = "${google_container_cluster.primary.endpoint}"
}


output "node_version" {
  value = "${google_container_cluster.primary.node_version}"
}


output "client_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.client_certificate}"
}


output "client_key" {
  value = "${google_container_cluster.primary.master_auth.0.client_key}"
}


output "cluster_ca_certificate" {
  value = "${google_container_cluster.primary.master_auth.0.cluster_ca_certificate}"
}
