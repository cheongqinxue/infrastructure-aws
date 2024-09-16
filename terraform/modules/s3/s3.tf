resource "aws_s3_bucket" "codepipeline_artifacts_bucket" {
  bucket = "codepipeline_artifacts"

  versioning {
    enabled = false
  }
}

resource "aws_s3_bucket" "lambda_artifacts_bucket" {
  bucket = "lambda_artifacts"

  versioning {
    enabled = false
  }
}
