variable "name_prefix" {
  description = "Prefix used for naming all resources in this module"
  type        = string
  default     = "StackGuardian"
}

variable "region" {
  type        = string
  default     = "eu-central-1"
  description = "AWS region in which resources will get deployed. Defaults to Frankfurt."
}

variable "availability_zones" {
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
  description = "Availability zones for the default Frankfurt region."
}

variable "bastion_instance_types" {
  type        = list(string)
  description = "Bastion instance types used for spot instances."
  default     = ["t4g.nano", "t4g.micro"]
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where bastion hosts and security groups will be created."
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR ranges for public subnets."
}

variable "tags" {
  type        = map(string)
  description = "Default tags attached to resources."
  default = {
    ServiceType = "SG-MP"
  }
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key used to connect to the bastion host"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to be used for bastion host. If not provided or known, it will default to latest amazon linux 2 image."
  default     = ""
}

variable "hosted_zone_id" {
  type        = string
  description = "Hosted zone id where DNS A record will be added for bastion host/s."
  default     = ""
}

variable "desired_capacity" {
  type        = number
  description = "The number of Amazon EC2 instances that should be running in the group."
  default     = 1
}

variable "on_demand_base_capacity" {
  type        = number
  description = "Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances."
  default     = 0
}

variable "max_size" {
  type        = number
  description = "Maximum number of bastion hosts in the group"
  default     = 1
}

variable "min_size" {
  type        = number
  description = "Minimum number of bastion hosts in the group."
  default     = 1
}

variable "ssh_port" {
  description = "SSH port used to access the bastion host."
  default     = 22
}

variable "ingress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR ranges to allow ssh access at security group level. Defaults to 0.0.0.0/0, which means the whole internet ;-)"
  default     = ["0.0.0.0/0"]
}

variable "ingress_ipv6_cidr_blocks" {
  type        = list(string)
  description = "List of IPv6 CIDR ranges to allow ssh access at security group level. Defaults to ::/0"
  default     = ["::/0"]
}

variable "egress_cidr_blocks" {
  type        = list(string)
  description = "List of CIDR ranges to allow outbound traffic at security group level. Defaults to 0.0.0.0/0"
  default     = ["0.0.0.0/0"]
}

variable "egress_ipv6_cidr_blocks" {
  type        = list(string)
  description = "List of IPv6 CIDR ranges to allow outbound traffic at security group level. Defaults to ::/0"
  default     = ["::/0"]
}

variable "enable_asg_scale_down" {
  type    = bool
  default = false
}

variable "enable_asg_scale_up" {
  type    = bool
  default = false
}

variable "asg_scale_down_recurrence" {
  type        = string
  description = "Scale Down - Start time is specified by the user following the Unix cron syntax format."
  default     = "0 18 * * MON-FRI"
}

variable "asg_scale_up_recurrence" {
  type        = string
  description = "Scale Up - Start time is specified by the user following the Unix cron syntax format."
  default     = "0 9 * * MON-FRI"
}

variable "asg_scale_down_max_size" {
  type        = number
  description = "Scale Down - Auto Scaling Group value for maximum number of bastion hosts."
  default     = 0
}

variable "asg_scale_down_min_size" {
  type        = number
  description = "Scale Down - Auto Scaling Group value for minimum number of bastion hosts."
  default     = 0
}

variable "asg_scale_down_desired_capacity" {
  type        = number
  description = "Scale Down - Auto Scaling Group value for desired number of bastion hosts."
  default     = 0
}

variable "asg_scale_up_max_size" {
  type        = number
  description = "Scale Up  - Auto Scaling Group value for maximum number of bastion hosts."
  default     = 1
}

variable "asg_scale_up_min_size" {
  type        = number
  description = "Scale Up - Auto Scaling Group value for minimum number of bastion hosts."
  default     = 1
}

variable "asg_scale_up_desired_capacity" {
  type        = number
  description = "Scale Up - Auto Scaling Group value for desired number of bastion hosts."
  default     = 1
}

variable "termination_policies" {
  type        = list(string)
  description = "Policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, OldestLaunchTemplate, AllocationStrategy."
  default     = ["OldestInstance"]
}

variable "userdata_file_content" {
  type        = string
  description = "The user data to provide when launching the instance."
  default     = ""
}

variable "device_name" {
  type        = string
  description = "The name of the instance device to mount."
  default     = "/dev/xvda"
}

variable "delete_on_termination" {
  type        = bool
  description = "Whether the volume should be destroyed on instance termination."
  default     = true
}

variable "volume_size" {
  type        = number
  description = "The size of the volume in gigabytes."
  default     = 20
}

variable "encrypted" {
  type        = bool
  description = "Enables EBS encryption on the volume."
  default     = true
}

variable "volume_type" {
  type        = string
  description = "The type of volume. Can be `standard`, `gp2`, or `io1`."
  default     = "gp2"
}

variable "time_zone" {
  type        = string
  default     = "Etc/UTC"
  description = "Used for ASG Scale Up/Down. Valid values are the canonical names of the IANA time zones (such as Etc/GMT+9 or London/Europe)"
}