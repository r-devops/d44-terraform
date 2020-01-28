/*
resource "null_resource" "hello" {
  count     = 2
  provisioner "local-exec" {
    command = "echo ${var.abc[0]}"
  }
}

// Resource giving a same value all the time in var.abc,
// But we need diffrent values of index, so index number 0 which we are using needs to be changed dynamically.

resource "null_resource" "hello1" {
  count = 2
  provisioner "local-exec" {
    command = "echo ${var.abc[count.index]}"
  }
}
*/
// Count has to be controlled using a input (variable) / situation (number of az in aws)

// iterate with variable length

resource "null_resource" "hello2" {
  count = length(var.abc)
  provisioner "local-exec" {
    command = "echo Hello , ${var.abc[count.index]}"
  }
}

variable "abc" {
  default = [1,2,3,4,5]
}