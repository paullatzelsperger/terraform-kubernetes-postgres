# terraform-kubernetes-postgres

A simple Terraform module to provision Postgres DBs on Kubernetes using Radius

## Usage

```shell
rad recipe register myrecipe --environment myenv --resource-type Applications.Datastores/redisCaches \
--template-kind terraform --template-path git::github.com/paullatzelsperger/terraform-kubernetes-postgres --template-version "1.0.0"
```