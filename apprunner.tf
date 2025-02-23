# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apprunner_service
resource "aws_apprunner_service" "nextjs-express-runner" {
  service_name = local.project_name
  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner.arn
    }
    image_repository {
      image_identifier = "${aws_ecr_repository.nextjs_express.repository_url}:v20250223024220"
      image_repository_type = "ECR"
      image_configuration {
        port = 3000
      }
    }
    auto_deployments_enabled = false
  }
  instance_configuration {
    cpu = 256
    memory = 512
  }

  lifecycle {
    ignore_changes = [source_configuration[0].image_repository[0].image_identifier]
  }
}