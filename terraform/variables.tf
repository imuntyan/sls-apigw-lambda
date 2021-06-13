variable "aws_region" {
  default     = "us-east-2"
  description = "AWS Region to deploy example API Gateway REST API"
  type        = string
}

variable "rest_api_domain_name" {
  default     = "example.com"
  description = "Domain name of the API Gateway REST API for self-signed TLS certificate"
  type        = string
}

variable "rest_api_name" {
  default     = "poc_s3proxy_api_gateway"
  description = "Name of the API Gateway REST API (can be used to trigger redeployments)"
  type        = string
}

variable "rest_api_path" {
  default     = "/path1"
  description = "Path to create in the API Gateway REST API (can be used to trigger redeployments)"
  type        = string
}

variable "additional_tags" {
  default     = {}
  description = "Additional resource tags"
  type        = map(string)
}
