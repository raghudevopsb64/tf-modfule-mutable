resource "aws_spot_instance_request" "spot" {
  count                  = var.SPOT_INSTANCE_COUNT
  ami                    = data.aws_ami.ami.id
  instance_type          = var.NODE_TYPE
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id              = var.SUBNET_IDS[0]
  wait_for_fulfillment   = true
  iam_instance_profile   = var.IAM_POLICY_CREATE ? aws_iam_instance_profile.instance-profile.*.name[0] : null

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}

resource "aws_ec2_tag" "name-tag" {
  count       = var.SPOT_INSTANCE_COUNT
  resource_id = element(aws_spot_instance_request.spot.*.spot_instance_id, count.index)
  key         = "Name"
  value       = "${var.COMPONENT}-${var.ENV}"
}

resource "aws_instance" "on-demand" {
  count                  = var.ONDEMAND_INSTANCE_COUNT
  ami                    = data.aws_ami.ami.id
  instance_type          = var.NODE_TYPE
  vpc_security_group_ids = [aws_security_group.main.id]
  subnet_id              = var.SUBNET_IDS[0]
  iam_instance_profile   = var.IAM_POLICY_CREATE ? aws_iam_instance_profile.instance-profile.*.name[0] : null

  tags = {
    Name = "${var.COMPONENT}-${var.ENV}"
  }
}
