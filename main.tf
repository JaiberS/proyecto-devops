provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "devops" {
  metadata {
    name = "devops"
    labels = {
      app = "devops"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "devops"
      }
    }

    template {
      metadata {
        labels = {
          app = "devops"
        }
      }

      spec {
        container {
          image = "jaibers10/devops:latest"
          name  = "devops"

          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "devops_service" {
  metadata {
    name = "devops-service"
  }

  spec {
    selector = {
      app = "devops"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 3000
    }

    type = "LoadBalancer"
  }
}
