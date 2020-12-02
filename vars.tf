variable "iam_policy_arn" {
  type = "list"
}

variable "private_cidr" {
  type = "list"
}

variable "public_cidr" {
  type = "list"
}

variable "cidr_range" {
  type = "list"
}

variable "ssh_key" {
  type = "list"
}

variable "ingress_sg_id" {
  type = "list"
}

variable "eks_name" {
  type = "list"
}

variable "private_subnet_tags" {
  type = "map"
}

variable "public_subnet_tags" {
  type = "map"
}

variable "private_subnet_az" {
  type = "list"
}

variable "public_subnet_az" {
  type = "list"
|
