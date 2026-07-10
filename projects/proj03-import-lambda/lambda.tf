import {
  to = aws_lambda_function.this
  id = "manually-created-lambda"
}


# Package the Lambda function code
data "archive_file" "lambda_code" {
  type        = "zip"
  source_file = "${path.root}/build/index.mjs"
  output_path = "${path.root}/build/lambda.zip"
}

resource "aws_lambda_function" "this" {
  description   = "A starter AWS Lambda function."
  filename      = data.archive_file.lambda_code.output_path
  function_name = "manually-created-lambda"
  handler       = "index.handler"
  #   role          = "arn:aws:iam::272775097675:role/service-role/manually-created-lambda-role-2tgnd9mn"
  role             = aws_iam_role.lambda_execution_role.arn
  runtime          = "nodejs22.x"
  source_code_hash = data.archive_file.lambda_code.output_base64sha256
  tags = {
    "lambda-console:blueprint" = "hello-world"
  }
  logging_config {
    log_format = "Text"
    log_group  = "/aws/lambda/manually-created-lambda"
  }
}


resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"
}

# resource "aws_lambda_permission" "allow_public_url" {
#   action                 = "lambda:InvokeFunctionUrl"
#   function_name          = aws_lambda_function.this.function_name
#   principal              = "*"
#   function_url_auth_type = "NONE"
# }

resource "aws_lambda_permission" "allow_public_function_invoke" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "*"
}