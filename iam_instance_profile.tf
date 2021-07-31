resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "${local.instance_name}-instance-profile"
  role = aws_iam_role.iam_role.name
}

