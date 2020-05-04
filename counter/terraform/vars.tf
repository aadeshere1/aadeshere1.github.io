variable "lambda_iam_role_name" {}

variable "iam_policy_arn" {
  description = "IAM Policy(policies) to be attached to role"
  type        = "list"
}
