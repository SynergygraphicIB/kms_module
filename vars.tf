#
# Terraform Provider(s) Variables
#
variable "master_id" {
  description = "The 12-digit account ID used for role assumption"
  default     = "489641906295"
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

#
# KMS Variables
#
variable "kms_description" {
  description = "Unique identifier for this KMS key"
  default     = "Testing 1 KMS Key"
}

variable "key_usage" {
  description = "KMS key is either Symectric ot Asymetric"
  default     = "ENCRYPT_DECRYPT"
}

variable "deletion_window_in_days" {
  description = "Number of days for key deletion"
  default     = "7"
}

variable "is_enabled" {
  description = "Is this KMS key Enabled or Disabled"
  type        = bool
  default     = "true"
}

variable "key_rotation" {
  description = "Allow KMS to auto rotate the KMS Key"
  type        = bool
  default     = "true"
}

variable "kms_alias" {
  default = "alias/synergy-kms-key"
}

# KMS_RDS VARIABLES

variable "kms_rds_description" {
  description = "Unique identifier for this KMS key"
  default     = "Testing KMS RDS Key"
}

variable "kms_rds_alias" {
  default = "alias/synergy-kms-rds-key"
}

# KMS_ECS VARIABLES

variable "kms_ecs_description" {
  description = "Unique identifier for this KMS key"
  default     = "Testing KMS ECS Key"
}

variable "kms_ecs_alias" {
  default = "alias/synergy-kms-ecs-key"
}
