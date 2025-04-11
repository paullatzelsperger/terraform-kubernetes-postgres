variable "context" {
  description = "Radius-provided object containing information about the resource calling the Recipe."
  type = any
}

variable "port" {
  description = "The port Postgres is offered on. Defaults to 5432."
  type = number
  default = 5432
}