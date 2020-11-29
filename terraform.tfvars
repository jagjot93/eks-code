iam_policy_arn = [ "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy", "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly", "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"]

private_cidr = [ "10.0.1.0/24", "10.0.2.0/24" ]
public_cidr = [ "10.0.3.0/24", "10.0.4.0/24"]
cidr_range = [ "10.0.0.0/16"]
ssh_key = [ "terraform" ]
ingress_sg_id = [ "sg-0087eb4d45761163b" ]
eks_name = [ "test" ]
