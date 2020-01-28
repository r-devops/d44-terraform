resource "null_resource" "input-n-ports-check" {
  count   = length(var.PORTS) == length(var.INPUTS) ? 0 : 1

  provisioner "local-exec" {
    command = "echo -e '\\e[31m INPUTS and VARS vars should be evenly given...'; false"
  }
}

resource "null_resource" "input-n-instance_types-check" {
  count   = length(var.INSTANCE_TYPE_APP) == length(var.INPUTS) ? 0 : 1

  provisioner "local-exec" {
    command = "echo -e '\\e[31m INPUTS and INSTANCE TYPES vars should be evenly given...'; false"
  }
}
