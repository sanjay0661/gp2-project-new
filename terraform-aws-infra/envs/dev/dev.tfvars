environment         = "dev-gp2"
vpc_cidr           = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
availability_zones = ["us-east-1a"]
create_nat_gateway = true

# Example Security Group Rules
security_group_rules = [
  { port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
]

egress_rules = [
    { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], description = "Allow all outbound traffic" }
  ]

  

#api_gateway

api_name   = "gp2-dev"
stage_name = "dev"

#iam-ecs

environment         = "develop-gp2"

#ecs

  source               = "../../modules/ecs"
  environment          = "develop-gp2"
  ami_id               = "ami-0c55b159cbfafe1f0"  # Update with a valid ECS-optimized AMI
  instance_type        = "t3.medium"
  key_name             = "devopsgp2"
  ebs_volume_size      = 50
  iam_instance_profile = module.iam.ecs_instance_profile
  asg_min_size         = 0
  asg_max_size         = 5
  asg_desired_capacity = 1
  private_subnet_ids   = module.vpc.private_subnet_ids



