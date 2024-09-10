terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_ssm_parameter" "team_name" {
  name = "/__platform__/team_name_handle"

  description = "The name of the team that owns this environment. Format is lowercase."
  type        = "String"
  value       = var.team_name

  allowed_pattern = "^[a-zæøå-]+$"

  lifecycle {
    ignore_changes = [
      name,
      type,
      value
    ]
  }
}
