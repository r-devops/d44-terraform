variable "i1" {
  default = [1,2]
}

variable "i2" {
  default = ["a","b"]
}

locals {
  i1-count=length(var.i1)
  i2-count=length(var.i2)
}

resource "null_resource" "vars-check" {
  count = local.i1-count == local.i2-count ? 0 : 1
  provisioner "local-exec" {
    command = "false"
  }
}