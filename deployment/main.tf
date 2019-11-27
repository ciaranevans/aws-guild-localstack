terraform {
  required_providers {
    aws = "2.39"
  }
}

provider aws {
  region                      = "eu-west-2"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://localstack:4567"
    cloudwatchlogs = "http://localstack:4586"
    dynamodb       = "http://localstack:4569"
    iam            = "http://localstack:4593"
    lambda         = "http://localstack:4574"
    s3             = "http://localstack:4572"
    sns            = "http://localstack:4575"
  }
}

resource aws_lambda_function guild-function {
  function_name = "guild-function"
  handler = "guild-function.handler"
  role = ""
  runtime = "python3.6"
  filename = "../lambda/guild-function.zip"
  timeout = 30
  memory_size = 128
}

resource aws_s3_bucket guild-bucket {
  bucket = "guild-bucket"
  acl = "private"
}
