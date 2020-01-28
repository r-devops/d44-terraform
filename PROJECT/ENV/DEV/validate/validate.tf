module "validate" {
  source                = "../../MODULES/validate"
  INPUTS                = var.INPUTS
  PORTS                 = var.PORTS
  INSTANCE_TYPE_APP     = var.INSTANCE_TYPE_APP
}