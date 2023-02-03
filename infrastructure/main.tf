# HCL - Hashicorp Configuration Language
# Linguagem declarativa

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

resource "aws_kms_key" "mykey" {
  description = "Esta chave é utilizada para encriptar os objetos do bucket"
  deletion_window_in_days = 10
}

resource "aws_s3_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake-tf.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")
}

provider "aws" {
  region = "us-east-1"
}