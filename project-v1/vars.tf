variable "inputs" {
  default = ["web", "app", "db"]
}

variable "ports" {
  default = ["80", "8080,8765", "27017,5672,3306"]
}