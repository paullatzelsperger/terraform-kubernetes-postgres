variable "context" {
  description = "Radius-provided object containing information about the resource calling the Recipe."
  type        = any
}

variable "port" {
  description = "The port Postgres is offered on. Defaults to 5432."
  type        = number
  default     = 5432
}

variable "user" {
  description = "The user name to use when connecting to Postgres. Defaults to 'postgres'."
  type        = string
  default     = "postgres"

}

variable "password" {
  description = "The password to use when connecting to Postgres. Defaults to 'postgres'."
  type        = string
  default     = "postgres"

}
variable "database" {
  description = "The name of the database to create. Defaults to 'postgres'."
  type        = string
  default     = "postgres"
}

variable "tag" {
  description = "The version of Postgres to use. Defaults to 'latest'."
  type        = string
  default     = "latest"

}