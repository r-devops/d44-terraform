module "M1" {
  source = "../MODULES/m1"
  m1     = var.m1
}

module "M2" {
  source = "../MODULES/m2"
  m2      = var.m2
}
