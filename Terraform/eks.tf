module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "dashboard-cluster"
  kubernetes_version = "1.33"

  addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent    = true
      before_compute = true
    }

    eks-pod-identity-agent = {
      most_recent = true
    }

    aws-ebs-csi-driver = {
      most_recent = true
    }
  }


  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_groups = {
    dashboard_nodes = {
      name = "dashboard-node"

      instance_types = ["t3.large"]

      capacity_type = "ON_DEMAND"

      min_size     = 1
      max_size     = 2
      desired_size = 1

      subnet_ids = module.vpc.private_subnets

      labels = {
        role        = "worker"
        environment = "dev"
      }

      tags = {
        Project = "dashboard"
      }
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
