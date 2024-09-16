####################################################################################################
# lambda
####################################################################################################

resource "aws_lambda_function" "hello_world_lambda" {
  function_name = "hello_world_lambda"
  s3_bucket     = aws_s3_bucket.lambda_artifacts.bucket
  s3_key        = "hello_world_lambda.zip"
  handler       = "hello_world.lambda_handler"
  runtime       = "python3.9"
  role          = aws_iam_role.lambda_exec_role.arn
}


####################################################################################################
# Set up Code Build
####################################################################################################

resource "aws_codebuild_project" "hello_lambda_build" {
  name          = "lambda_codebuild_project"
  service_role  = aws_iam_role.codebuild_role.arn
  source {
    type      = "GITHUB"
    location  = "https://github.com/cheongqinxue/lambda-hello-world.git"
    buildspec = "hello_world/buildspec.yml"
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type              = "BUILD_GENERAL1_SMALL"
    image                     = "aws/codebuild/standard:6.0"
    type                      = "LINUX_CONTAINER"
    environment_variables = [{
      name  = "FUNCTION_NAME"
      value = "hello_world_lambda"
    }]
  }
}


####################################################################################################
# CodePipeline
####################################################################################################


resource "aws_codepipeline" "lambda_pipeline" {
  name     = "hello-world-lambda-pipeline"
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.lambda_artifacts.bucket
  }

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "ThirdParty"
      provider         = "GitHub"
      version          = "1"
      output_artifacts = ["source_output"]
      configuration = {
        Owner  = var.github_username
        Repo   = "lambda_hello_world"
        Branch = "main"
        OAuthToken = var.github_token  # You may store this in AWS Secrets Manager or directly in Terraform variables.
      }
    }
  }

  stage {
    name = "Build"
    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      configuration = {
        ProjectName = aws_codebuild_project.lambda_build.name
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name             = "Deploy"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "Lambda"
      input_artifacts  = ["build_output"]
      configuration = {
        FunctionName = aws_lambda_function.hello_world_lambda.function_name
        S3Bucket     = aws_s3_bucket.lambda_artifacts.bucket
        S3ObjectKey  = "hello_world_lambda.zip"
      }
    }
  }
}
