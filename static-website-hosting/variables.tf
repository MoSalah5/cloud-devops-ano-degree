variable "bucket_name" {
  type        = string
  description = "provide a globally unique bucket name"
}

variable "region_name" {
  type = string
}

variable "source_bucket" {
  type        = string
  description = "Source artefact bucket name"
}

variable "aws_profile_name" {
  type        = string
  description = "AWS config profile name"
}

variable "project_name" {
  type = string
}