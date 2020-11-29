resource "aws_eks_cluster" "eks" {
  name = "test"
  role_arn = aws_iam_role.cluster_role.arn
  version = 1.17

  depends_on = [ aws_iam_role_policy_attachment.cluster_attach ]

  enabled_cluster_log_types = [ "api", "audit", "authenticator", "controllerManager", "scheduler"]

  vpc_config {
   endpoint_private_access = true
   endpoint_public_access = true
   public_access_cidr = "0.0.0.0/0"

   count = "${length(aws_subnet.private)}"
   count1 = "${length(aws_subnet.public)}"
   subnet_ids = [aws_subnet.private[count.index].id, aws_subnet.public[count1.index].id]
  }
}

