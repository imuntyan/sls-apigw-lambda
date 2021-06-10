module "s3-rest-api" {
  source = "./s3-rest-api"
  aws_region = var.aws_region
  rest_api_name = var.rest_api_name
  rest_api_path = var.rest_api_path
  additional_tags = var.additional_tags
}
