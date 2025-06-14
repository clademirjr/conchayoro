output "ecr_repository_url" {
  description = "ECR repository URL"
  value       = aws_ecr_repository.cyo_ecr_repo.repository_url
}

output "elastic_beanstalk_endpoint" {
  description = "EB endpoint URL"
  value       = aws_elasticbeanstalk_environment.cyo_ebef.endpoint_url
}
