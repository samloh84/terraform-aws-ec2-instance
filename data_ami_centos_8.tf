// Find latest Centos AMI
data "aws_ami" "centos_8" {
  most_recent = true

  filter {
    name = "product-code"
    values = [
      "47k9ia2igxpcce2bzo8u3kj03"]
  }

  filter {
    name = "ena-support"
    values = [
      "true"]
  }


  owners = [
    "aws-marketplace"
  ]
}
