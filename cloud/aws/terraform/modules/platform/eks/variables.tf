variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "eks_cluster_version" {
  description = "The version of the EKS cluster"
  type        = string
}

variable "vpc_private_subnets" {
  description = "The list of the private subnets"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "worker_group_mgmt_one_ids" {
  description = "The list of the worker group ids"
  type        = list(string)
}
variable "worker_group_mgmt_two_ids" {
  description = "The list of the worker group ids"
  type        = list(string)
}

