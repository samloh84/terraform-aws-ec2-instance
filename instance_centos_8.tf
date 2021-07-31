
resource "aws_instance" "centos" {

  ami = coaelesce(var.ami_id, data.aws_ami.centos_8.image_id)
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_public_ip_address

  dynamic "credit_specification" {
    for_each = length(regex("^t[23]", var.instance_type))>0?[
      {
        cpu_credits = var.cpu_credits
      }]:[]

    content {
      cpu_credits = credit_specification.value["cpu_credits"]
    }
  }


  ebs_optimized = var.ebs_optimized
  get_password_data = var.get_password_data

  iam_instance_profile = var.iam_instance_profile

  key_name = var.key_name

  source_dest_check = var.source_dest_check
  subnet_id = var.subnet_id

  user_data_base64 = data.cloudinit_config.cloudinit_config.rendered

  volume_tags = var.volume_tags

  vpc_security_group_ids = var.vpc_security_group_ids

  tags = merge({
    Name = local.instance_name
  }, local.common_tags)
}

