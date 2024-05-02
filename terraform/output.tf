output "api_url" {
  description = "URL to invoke the lambda"
  value = aws_apigatewayv2_stage.lambdastage.invoke_url
}

output "key_route" {
    description = "Key route to see the content of the code"
    value = aws_apigatewayv2_route.lambdaapi.route_key
}

output "function_name" {
    description = "Name of the Lambda function created"
    value = aws_lambda_function.lambdaapi.function_name
}