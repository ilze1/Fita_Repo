output "public_sub_id" {
  description = "public_sub_id"
  value       = aws_subnet.public_sub.id
}
output "private_sub_id" {
  description = "private_sub_id"
  value       = aws_subnet.private_sub.id
}

output "public_sec_group_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_security_group.public_sec_group.id
}

output "private_sec_group_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_security_group.private_sec_group.id
}