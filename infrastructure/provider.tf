# HCL - Hashicorp Configuration Language
# Linguagem declarativa
# Definindo o Provider

provider "aws" {
  region = var.aws_region
}

# Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "terrafor-state-igti-rui"
    key    = "state/igti/edc/mod1/terraform.tfstate"
    region = "us-east-1"
  }
}