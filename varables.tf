variable "namespace" {
  description = "The project namespace to use for unique resource naming"
  default     = "EC2-flag"
  type        = string
}

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "key_pair" {
  type    = string
  default = "us-east-1"
}
