terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}

resource "kubernetes_deployment" "postgres" {
  metadata {
    name = "postgres-${sha512(var.context.resource.id)}"
    namespace = var.context.runtime.kubernetes.namespace
    labels = {
      app = "postgres"
    }
  }
  spec {
    selector {
      match_labels = {
        app = "postgres"
        resource = var.context.resource.name
      }
    }
    template {
      metadata {
        labels = {
          app = "postgres"
          resource = var.context.resource.name
        }
      }
      spec {
        container {
          name  = "postgres"
          image = "postgres:16"
          port {
            container_port = 5432
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "postgres" {
  metadata {
    name = "postgres-${sha512(var.context.resource.id)}"
    namespace = var.context.runtime.kubernetes.namespace
  }
  spec {
    type = "ClusterIP"
    selector = {
      app = "postgres"
      resource = var.context.resource.name
    }
    port {
      port        = var.port
      target_port = "5432"
    }
  }
}