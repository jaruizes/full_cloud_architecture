output "id" {
  value       = module.vpc.vpc_id
  description = "VPC ID"
}

output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "VPC Private Subnets"
}

output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "VPC Public Subnets"
}
