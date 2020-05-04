# https://docs.aws.amazon.com/lambda/latest/dg/lambda-intro-execution-role.html
# https://www.terraform.io/docs/providers/aws/r/iam_role.html

resource "aws_iam_role" "visit-count-executor" {
  name = "${var.lambda_iam_role_name}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}




# https://stackoverflow.com/questions/45486041/how-to-attach-multiple-iam-policies-to-iam-roles-using-terraform
# https://www.terraform.io/docs/configuration/functions/element.html
resource "aws_iam_policy_attachment" "lambda-policy-attachment" {
  name       = "test-attachment"
  roles      = ["${aws_iam_role.visit-count-executor.name}"]
  count      = "${length(var.iam_policy_arn)}"
  policy_arn = "${element(var.iam_policy_arn, count.index)}"
}
