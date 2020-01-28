output "max-value" {
  value = max(1,2,100)
}

output "NAME-IN-UPPER" {
  value = upper(var.name)
}

output "NAME-IN-UPPER1" {
  value = "Value in UPPER = ${upper(var.name)}"
}
