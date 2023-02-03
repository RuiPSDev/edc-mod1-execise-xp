# HCL - Hashicorp Configuration Language
# Linguagem declarativa
# Criação do bucket

resource "aws_s3_bucket" "datalake-tf" {
  # Parametros de configuração do recusrso escolhido
  bucket = "${var.base_bucket_name}-${var.ambiente}-${var.numero_conta}"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "datalake-tf" {
    bucket = aws_s3_bucket.datalake-tf.id

    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}

resource "aws_s3_bucket_acl" "datalake-tf" {
  bucket = aws_s3_bucket.datalake-tf.id
  acl = "private"
}