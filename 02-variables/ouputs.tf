output "v1" {
  value = var.v1
}

output "v2" {
  value = var.v2
}

output "v3" {
  value = var.v3
}

output "v4" {
  value = var.v4
}

// Get one value from a list

output "v4-1" {
  value = var.v4[1]
}

output "v5" {
  value = "Name = ${var.v5["name"]}, Value = ${var.v5["value"]}"
}
