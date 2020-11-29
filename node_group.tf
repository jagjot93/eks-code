resource "aws_eks_node_group" "eks_node_group" {
  cluster_name = aws_eks_cluster.eks.name
  node_group_name = "test_node_group"
  node_role_arn = aws_iam_role.node_role.arn
#  count = "${length(aws_subnet.private)}"
  subnet_ids = [aws_subnet.private[0].id, aws_subnet.private[1].id]

  scaling_config {
    desired_size = 2
    max_size = 4
    min_size = 2
  }

  depends_on = [
    aws_iam_role_policy_attachment.node_attach
  ]

  instance_types = [ "t3a.medium" ]

  remote_access {
    ec2_ssh_key = "${var.ssh_key[0]}"
    source_security_group_ids = [ "${var.ingress_sg_id[0]}" ]
  }
}

