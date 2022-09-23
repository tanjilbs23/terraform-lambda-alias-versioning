module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "test_alias_versioning"
  description   = "My awesome lambda function"
  handler       = "lambda_handler.lambda_handler"
  runtime       = "python3.9"
  publish = true

  source_path = "lambda/test_alias_versioning/src"

  tags = {
    Name = "test_alias_versioning_test"
  }
}

module "alias_no_refresh" {
  source = "terraform-aws-modules/lambda/aws//modules/alias"

  refresh_alias = false

  name = "current-no-refresh"

  function_name    = module.lambda_function.lambda_function_name
  function_version = module.lambda_function.lambda_function_version

  # allowed_triggers = {
  #   AnotherAPIGatewayAny = {
  #     service    = "apigateway"
  #     source_arn = "arn:aws:execute-api:eu-west-1:135367859851:abcdedfgse/*/*/*"
  #   }
  # }
}