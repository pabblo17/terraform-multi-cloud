resource "aws_eks_cluster" "k8s_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.eks_cluster.arn

  vpc_config {
    subnet_ids = aws_subnet.eks[*].id
  }
}

resource "aws_eks_node_group" "on_demand" {
  cluster_name    = aws_eks_cluster.k8s_cluster.name
  node_group_name = "on-demand-group"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = aws_subnet.eks[*].id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  instance_types = ["t3.small"]
}

resource "aws_eks_node_group" "spot" {
  cluster_name    = aws_eks_cluster.k8s_cluster.name
  node_group_name = "spot-group"
  node_role_arn   = aws_iam_role.eks_nodes.arn
  subnet_ids      = aws_subnet.eks[*].id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  instance_types = ["t3.small"]

  capacity_type = "SPOT"
}
