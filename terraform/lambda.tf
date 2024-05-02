resource "aws_lambda_function" "lambdaapi" {
  function_name = "lambdaapi"
  filename = "../api_publico.zip"
  handler = "api_publico.lambda_handler"
  runtime = "python3.12"

  role = "${aws_iam_role.lambdaapi_role.arn}"
}

resource "aws_iam_role" "lambdaapi_role" {
  name = "lambdaapi_role"

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