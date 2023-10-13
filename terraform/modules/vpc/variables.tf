variable "vpc_id" {
  description = "The EC2 instance type"
  type        = string
  default     = "vpc-0f488eb699cfd3961"
}
variable "tags" {
  description = "A map of tags to apply to AWS resources."
  type        = map(string)
  default     = {
    Owner        = "Grupa 1"
    Environment  = "Development"
  }
}