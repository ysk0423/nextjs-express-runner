locals {
  project_name = "nextjs-express-runner"
  current_time = formatdate("YYYYMMDDhhmmss", timestamp())
}

variable "aws_region" {
  description = "AWSのリージョン"
  default     = "ap-northeast-1"
}

variable "github_repo_url" {
  description = "GitHubのリポジトリURL"
  type        = string
  default     = "https://github.com/ysk0423/nextjs-express"
}
