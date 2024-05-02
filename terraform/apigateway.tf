resource "aws_apigatewayv2_api" "apigateway" {
  name          = "apigateway"
  protocol_type = "HTTP"
  description   = "Api Gateway for Lambda Function"
}

resource "aws_apigatewayv2_stage" "lambdastage" {
  api_id = aws_apigatewayv2_api.apigateway.id

  name        = "lambdastage"
  auto_deploy = true
}


resource "aws_apigatewayv2_integration" "lambda" {
  api_id = aws_apigatewayv2_api.apigateway.id

  integration_uri    = aws_lambda_function.lambdaapi.invoke_arn
  integration_type   = "AWS_PROXY"
  integration_method = "POST"
}

resource "aws_apigatewayv2_route" "lambdaapi" {
  api_id = aws_apigatewayv2_api.apigateway.id

  route_key = "ANY /lambdaapi"
  target    = "integrations/${aws_apigatewayv2_integration.lambda.id}"
}

resource "aws_lambda_permission" "api_gw" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambdaapi.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.apigateway.execution_arn}/*/*"
}