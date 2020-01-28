resource "null_resource" "sample" {
  provisioner "local-exec" {
    command = "echo Hello from M1 Module - ${var.m1}"
  }
}