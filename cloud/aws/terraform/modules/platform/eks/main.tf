module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version
  subnets         = var.vpc_private_subnets

  tags = {
    app = "realtime"
  }

  vpc_id = var.vpc_id

  node_groups_defaults = {
    ami_type  = "AL2_x86_64"
    disk_size = 50
    additional_tags = {
      app = "realtime"
    }
  }

  node_groups = {
    realtime_eks_workers = {
      name = "realtime_eks_workers"
      desired_capacity = 2
      max_capacity     = 4
      min_capacity     = 2

      instance_type = "t2.medium"
      k8s_labels = {
        Environment = "dev"
      }

    }
  }
}
