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
    name      = "postgres-${uuidv5("url", var.context.resource.id)}"
    namespace = var.context.runtime.kubernetes.namespace
    labels = {
      app = "postgres"
    }
  }
  spec {
    selector {
      match_labels = {
        app      = "postgres"
        resource = var.context.resource.name
      }
    }
    template {
      metadata {
        labels = {
          app      = "postgres"
          resource = var.context.resource.name
        }
      }
      spec {
        container {
          name  = "postgres"
          image = "postgres:${var.tag}"
          port {
            container_port = 5432
          }
          env {
            name  = "POSTGRES_USER"
            value = var.username
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = var.password
          }
          env {
            name  = "POSTGRES_DB"
            value = var.db_name
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "postgres" {
  metadata {
    name      = "postgres-${uuidv5("url", var.context.resource.id)}"
    namespace = var.context.runtime.kubernetes.namespace
  }
  spec {
    type = "ClusterIP"
    selector = {
      app      = "postgres"
      resource = var.context.resource.name
    }
    port {
      port        = var.port
      target_port = "5432"
    }
  }
}