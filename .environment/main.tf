resource "aws_ecr_repository" "cyo_ecr_repo" {
  name                 = "${var.PROJECT_NAME}/${var.MODULE_NAME}"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_elastic_beanstalk_application" "cyo_eba" {
  name        = var.PROJECT_NAME
  description = "Project application"
}

resource "aws_elastic_beanstalk_environment" "cyo_ebef" {
  name                = var.MODULE_NAME
  application         = aws_elasticbeanstalk_application.cyo_eba.name
  solution_stack_name = var.SOLUTION_STACK_NAME

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = var.EnvironmentType
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = var.LoadBalancerType
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.MinSize
  }
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.MaxSize
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "DeploymentPolicy"
    value     = var.DeploymentPolicy
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSizeType"
    value     = var.BatchSizeType
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "BatchSize"
    value     = var.BatchSize
  }
  setting {
    namespace = "aws:elasticbeanstalk:command"
    name      = "Timeout"
    value     = var.Timeout
  }
}
