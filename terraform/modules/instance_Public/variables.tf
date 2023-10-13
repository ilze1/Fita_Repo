variable "subnet_id" {
  description = "Subnet id"
  type        = string
}

variable "public_sec_group" {
  description = "public sec group id"
  type        = string
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.large"
}

variable "tags" {
  description = "A map of tags to apply to AWS resources."
  type        = map(string)
  default     = {
    Owner        = "Grupa 1"
    Environment  = "Development"
  }
}

