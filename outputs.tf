output "security_group_id" {
  description = "The ID of the bastion host security group."
  value       = aws_security_group.bastion-sg.id
}

output "auto_scaling_group_id" {
  description = "The ID of the bastion host auto scaling group."
  value       = aws_autoscaling_group.bastion-asg.id
}

output "auto_scaling_group_arn" {
  description = "The ARN of the bastion host auto scaling group."
  value       = aws_autoscaling_group.bastion-asg.arn
}

output "launch_template_id" {
  description = "The ID of the bastion host launch template."
  value       = aws_launch_template.bastionhost.id
}

output "launch_template_arn" {
  description = "The ARN of the bastion host launch template."
  value       = aws_launch_template.bastionhost.arn
}

output "iam_role_arn" {
  description = "The ARN of the bastion host IAM Role."
  value       = aws_iam_role.bastion-role.arn
}

output "iam_role_id" {
  description = "The ID or name of the bastion host IAM Role."
  value       = aws_iam_role.bastion-role.id
}