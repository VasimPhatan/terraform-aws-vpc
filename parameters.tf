resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}-${var.environment}/vpc_id" #name as roboshop-dev/vpc_id
  type  = "String" 
  value = module.vpc.vpc_id 
}
