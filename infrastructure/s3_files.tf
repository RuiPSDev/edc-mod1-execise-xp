# HCL - Hashicorp Configuration Language
# Linguagem declarativa
# Declaração dos arquivos/objetos a serem manipulados

resource "aws_s3_object" "codigo_spark" {
  bucket = aws_s3_bucket.datalake-tf.id
  key    = "emr-code/pyspark/job_spark_from_tf.py"
  source = "../job_spark.py"
  etag   = filemd5("../job_spark.py")
}
