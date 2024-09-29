resource "aws_api_gateway_rest_api" "api-gateway" {
  name        = "api-gtw-restaurante-grupo36"
  description = "API Gateway Grupo 36 - FIAP"
}

provider "aws" {
  # Configuration options
}