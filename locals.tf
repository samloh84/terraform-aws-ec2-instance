locals {

  instance_name = coalesce(var.instance_name, var.project_name)

  iam_role_policy_arns = concat( [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"],
  var.iam_role_policy_arns)

  common_tags = merge({
    Project = var.project_name
    Owner = var.owner
  }, var.tags)

}
