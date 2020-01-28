// Declare a string
variable "v1" {
  default = "Hello"
}

// Declare a Number
variable "v2" {
  default = 100
}

// Declare a Boolean
variable "v3" {
  default = false
}

// Declare a list
variable "v4" {
  default = [1, 2, 3]
}

// Declare a map
variable "v5" {
  default = {
    name = "sample",
    value = 200
  }
}