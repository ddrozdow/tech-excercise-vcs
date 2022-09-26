provider "kubernetes" {
      #config_path    = "~/.kube/config"
      host  = "https://${data.google_container_cluster.primary.endpoint}"
      token = data.google_client_config.provider.access_token
      cluster_ca_certificate = base64decode(
        data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
}

resource "kubernetes_service" "example" {
  metadata {
    name = "terraform-example"
  }
  spec {
    selector = {
      app = kubernetes_pod.example.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_pod" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      app = "MyApp"
    }
  }

  spec {
    container {
      image = "wordpress:6"
      name  = "example"
    }
  }
}
output "wordpressip" {
          value = kubernetes_service.example.status.0.load_balancer.0.ingress.0.ip
  
}