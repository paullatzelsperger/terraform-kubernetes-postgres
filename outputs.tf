output "result" {
  value = {
    values = {
      host = "${kubernetes_service.postgres.metadata.0.name}.${kubernetes_service.postgres.metadata.0.namespace}.svc.cluster.local"
      port = kubernetes_service.postgres.spec.0.port.0.port
      username = ""
    }
    secrets = {
      password = ""
    }
    // UCP resource IDs
    resources = [
        "/planes/kubernetes/local/namespaces/${kubernetes_service.postgres.metadata.0.namespace}/providers/core/Service/${kubernetes_service.postgres.metadata.0.name}",
        "/planes/kubernetes/local/namespaces/${kubernetes_deployment.postgres.metadata.0.namespace}/providers/apps/Deployment/${kubernetes_deployment.postgres.metadata.0.name}"
    ]
  }
  description = "The result of the Recipe. Must match the target resource's schema."
  sensitive = true
}