provider "aws" {
  region = "eu-west-1"
  profile = "paradigma"
}

provider "kubernetes" {
  #load_config_file       = false
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

locals {
  cluster_name = "realtime_eks"
}

module "vpc" {
  source = "./modules/platform/vpc"
  eks_cluster_name = local.cluster_name
}

module "security_groups" {
  source = "./modules/platform/security_groups"
  vpc_id = module.vpc.id
}

module "eks" {
  source = "./modules/platform/eks"
  eks_cluster_name = local.cluster_name
  vpc_id = module.vpc.id
  vpc_private_subnets = module.vpc.private_subnets
  worker_group_mgmt_one_ids = [module.security_groups.worker_group_mgmt_one_ids]
  worker_group_mgmt_two_ids = [module.security_groups.worker_group_mgmt_two_ids]
  eks_cluster_version = "1.19"
}

output "vpc_id" {
  value = module.vpc.id
}

output "cluster_id" {
  value = module.eks.cluster_id
}

