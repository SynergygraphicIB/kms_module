data "aws_availability_zones" "available" {}
data "aws_caller_identity" "current" {}

module "kms" {
  source                  = "./modules/kms"
  master_id               = var.master_id
  kms_description         = var.kms_description
  key_usage               = var.key_usage
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.is_enabled
  key_rotation            = var.key_rotation
  policy                  = data.aws_iam_policy_document.synergy_key_policy.json
  alias                   = var.kms_alias
}

module "kms_rds" {
  source                  = "./modules/kms"
  master_id               = var.master_id           // remains the same account
  kms_description         = var.kms_rds_description // t'is unique to this module
  key_usage               = var.key_usage
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.is_enabled
  key_rotation            = var.key_rotation
  policy                  = data.aws_iam_policy_document.synergy_key_policy_ecs.json
  alias                   = var.kms_rds_alias
}


module "kms_ecs" {
  source                  = "./modules/kms"
  master_id               = var.master_id           // remains the same account
  kms_description         = var.kms_ecs_description // t'is unique to this module
  key_usage               = var.key_usage
  deletion_window_in_days = var.deletion_window_in_days
  is_enabled              = var.is_enabled
  key_rotation            = var.key_rotation
  policy                  = data.aws_iam_policy_document.synergy_key_policy_ecs.json
  alias                   = var.kms_ecs_alias
}
