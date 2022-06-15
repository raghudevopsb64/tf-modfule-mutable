variable "NODE_TYPE" {}
variable "ENV" {}
variable "COMPONENT" {}

variable "VPC_ID" {}
variable "VPC_CIDR" {}
variable "SUBNET_IDS" {}
variable "ONDEMAND_INSTANCE_COUNT" {}
variable "SPOT_INSTANCE_COUNT" {}

variable "WORKSTATION_IP" {}
variable "PORT" {}

variable "IAM_POLICY_CREATE" {
  default = false
}

variable "IS_ALB_INTERNAL" {
  default = true
}

variable "VPC_ACCESS_TO_ALB" {}
variable "DOCDB_ENDPOINT" {
  default = null
}

variable "PRIVATE_HOSTED_ZONE_ID" {}

