variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "Environment must be dev or prod"
  }
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "availability_zones" {
  description = "AZs for subnets"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ec2_count" {
  description = "Number of EC2 instances in prod"
  type        = number
  default     = 2

  validation {
    condition     = var.ec2_count > 0
    error_message = "EC2 count must be greater than 0"
  }
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "enable_monitoring" {
  description = "Enable monitoring"
  type        = bool
  default     = false
}

variable "bucket_name" {
  description = "Base S3 bucket name"
  type        = string
}

variable "common_tags" {
  description = "Common resource tags"
  type        = map(string)
}
