output "codepipeline_artifacts_bucket" {
  value       = aws_s3_bucket.codepipeline_artifacts_bucket.bucket
  description = "Bucket to store codepipeline artifacts"
}
