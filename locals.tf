locals {
  ALL_INSTANCE_IPS = concat(aws_spot_instance_request.spot.*.private_ip, aws_instance.on-demand.*.private_ip)
  ALL_INSTANCE_IDS = concat(aws_spot_instance_request.spot.*.spot_instance_id, aws_instance.on-demand.*.id)
}