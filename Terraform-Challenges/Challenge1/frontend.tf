resource "kubernetes_deployment" "frontend" {
  metadata {
    name = "frontend"
    labels = {
      test = "frontend"
    }
  }

  spec {
    replicas = 4

    selector {
      match_labels = {
        name = "webapp"
      }
    }

    template {
      metadata {
        match_labels = {
          name = "webapp"
        }
      }

      spec {
        container {
          image = "kodekloud/webapp-color:v1"
          name  = "webapp"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}