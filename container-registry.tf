resource "aws_ecr_repository" "nextjs_express" {
  name = local.project_name

  encryption_configuration {
    encryption_type = "KMS"
  }

  image_scanning_configuration {
    scan_on_push = false
  }
}
