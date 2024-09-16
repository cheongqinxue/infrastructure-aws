data "aws_s3_bucket" "k_lambda_artifacts" {
  bucket = "k-lambda-artifacts"
}

data "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"
}

data "aws_iam_role" "codepipeline_role" {
  name = "codepipeline_role"
}