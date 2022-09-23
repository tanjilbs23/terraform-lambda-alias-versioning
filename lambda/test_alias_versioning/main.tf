module "lambda_function" {
  source = "terraform-aws-modules/lambda/aws"

  function_name = "test_alias_versioning"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.9"

  source_path = "lambda/src/test_alias_versioning"

  tags = {
    Name = "test_alias_versioning"
  }
}