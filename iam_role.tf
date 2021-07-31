
resource "aws_iam_role" "iam_role" {
  name                  = "${local.instance_name}-instance-profile-iam-role"
  assume_role_policy    = data.aws_iam_policy_document.assume_role_policy_document.json
  force_detach_policies = true

  tags = merge({
    Name = "${local.instance_name}-instance-profile-iam-role"
  }, local.common_tags)
}


data "aws_iam_policy_document" "assume_role_policy_document" {
  statement {
    principals {
      identifiers = [
      "ec2.amazonaws.com"]
      type = "Service"
    }
    actions = [
    "sts:AssumeRole"]
  }
}

variable "iam_role_policy_arns" {
  type = list(string)
  default = []
}

resource "aws_iam_role_policy_attachment" "iam_role_policy_attachment" {
  count      = length(local.iam_role_policy_arns)
  policy_arn = local.iam_role_policy_arns[count.index]
  role       = aws_iam_role.iam_role.name
}