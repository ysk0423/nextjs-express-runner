resource "aws_codebuild_project" "nextjs-express-build" {
  name          = "${local.project_name}-build"
  build_timeout = "15"
  service_role  = aws_iam_role.codebuild.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  source {
    buildspec       = "aws/buildspec.yml"
    type            = "GITHUB"
    location        = var.github_repo_url
    git_clone_depth = 1
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "AWS_REGION"
      value = var.aws_region
    }

    environment_variable {
      name  = "ECR_REPO_URI"
      value = aws_ecr_repository.nextjs_express.repository_url
    }
  }
}
