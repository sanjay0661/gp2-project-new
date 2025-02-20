module "vpc" {
  source = "../../modules/vpc"

  environment           = "develop-gp2"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  availability_zones   = ["us-east-1a"]
  create_nat_gateway   = true
}



module "security_group" {
  source          = "../../modules/security-groups"
  environment     = "develop-gp2"
  vpc_id          = module.vpc.vpc_id
  ingress_rules = [
    { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "Allow SSH" },
    { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "Allow HTTP" },
    { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"], description = "Allow HTTPS" }
  ]

  egress_rules = [
    { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "Allow all outbound traffic" }
  ]
  
}

module "api_gateway" {
  source              = "../../modules/api-gateway"
  environment         = "develop-gp2"
  stage_name          = "dev"
  security_group_id   = module.security_group.security_group_id
  private_subnet_ids  = module.vpc.private_subnet_ids
}

module "iam" {
  source              = "../../modules/iam"
  environment         = "develop-gp2"
}

module "ecs" {
  source               = "../../modules/ecs"
  cluster_name         = "dev-ecs-cluster"
  ami_id               = "ami-0c55b159cbfafe1f0"  # Update with a valid ECS-optimized AMI
  instance_type        = "t3.medium"
  key_name             = "devopsgp2"
  ebs_volume_size      = 50
  iam_instance_profile = module.iam.ecs_instance_profile
  asg_min_size         = 0
  asg_max_size         = 5
  asg_desired_capacity = 1
  private_subnet_ids   = module.vpc.private_subnet_ids
  security_group_id    = module.security_group.security_group_id
  vpc_id               = module.vpc.vpc_id
 
}


module "ecr" {
  source            = "../../modules/ecr"
  repository_name   = "develop-gp2"
  image_tag_mutability = "MUTABLE"
  encryption_type   = "AES256"
  scan_on_push      = true
}

