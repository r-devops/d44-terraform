resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo Hello from M2 Module - ${var.m2}"
  }
}