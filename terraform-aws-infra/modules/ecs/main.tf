
resource "aws_security_group" "ecs_sg" {
  name        = "${var.cluster_name}-ecs-sg"
  description = "Security group for ECS instances"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ecs_ingress_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
      description = ingress.value["description"]
    }
  }

  dynamic "egress" {
    for_each = var.ecs_egress_rules
    content {
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
      description = egress.value["description"]
    }
  }



  tags = {
    Name = "${var.cluster_name}-ecs-sg"
  }
}


resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.cluster_name
}

resource "aws_launch_template" "ecs_launch_template" {
  name_prefix   = "ecs-template-"
  image_id      = var.ami_id  # Ensure this is an ECS-optimized AMI
  instance_type = var.instance_type
  key_name      = var.key_name

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size = var.ebs_volume_size
      volume_type = "gp3"
    }
  }

 network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.ecs_sg.id]
  }


  iam_instance_profile {
    name = var.iam_instance_profile
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ecs-instance"
    }
  }
}

resource "aws_autoscaling_group" "ecs_asg" {
  name                      = "ecs-asg"
  min_size                  = var.asg_min_size
  max_size                  = var.asg_max_size
  desired_capacity          = var.asg_desired_capacity
  vpc_zone_identifier       = var.private_subnet_ids

  launch_template {
    id      = aws_launch_template.ecs_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ecs-instance"
    propagate_at_launch = true
  }
}
