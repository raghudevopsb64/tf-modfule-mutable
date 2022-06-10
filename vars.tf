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
