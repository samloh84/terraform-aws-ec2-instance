variable "install_ssm" {
  type = bool
  default = false
}
locals {

  user_data = var.install_ssm? merge(var.user_data, {
    packages = concat([
      "https://s3.${data.aws_region.region.name}.amazonaws.com/amazon-ssm-${data.aws_region.region.name}/latest/linux_amd64/amazon-ssm-agent.rpm"
    ], lookup(var.user_data, "packages", []))
    runcmd = concat([
      [
        "systemctl",
        "enable",
        "amazon-ssm-agent"],
      [
        "systemctl",
        "start",
        "amazon-ssm-agent"]
    ], lookup(var.user_data, "runcmd", []))
  }):var.user_data


  user_data_yml = yamlencode(local.user_data)

}

data "cloudinit_config" "cloudinit_config" {
  gzip = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = local.user_data_yml
  }
}
