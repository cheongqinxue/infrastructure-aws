module "s3" {
  source = "./modules/s3"
}

module "iam" {
  source = "./modules/iam"

  depends_on = [
    module.s3.codepipeline_artifacts_bucket
  ]
}


module "hello" {
  source = "./modules/hello"

  depends_on = [
    module.iam.lambda_exec_role
  ]
}