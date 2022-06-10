locals {
  ALL_INSTANCE_IPS = concat(aws_spot_instance_request.spot.*.private_ip, aws_instance.on-demand.*.private_ip)
}