output "worker_group_mgmt_one_ids" {
  value       = aws_security_group.worker_group_mgmt_one.id
  description = "The ids of security group (worker_group_mgmt_one)"
}
output "worker_group_mgmt_two_ids" {
  value       = aws_security_group.worker_group_mgmt_two.id
  description = "The ids of security group (worker_group_mgmt_two)"
}
