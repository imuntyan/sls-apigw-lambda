resource "aws_api_gateway_rest_api" "poc_s3proxy_api_gateway" {
  name = var.rest_api_name

  tags = merge(
    var.additional_tags,
    {},
  )

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
