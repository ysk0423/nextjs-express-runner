resource "aws_codestarconnections_connection" "this" {
  name          = local.project_name
  provider_type = "GitHub"
}
