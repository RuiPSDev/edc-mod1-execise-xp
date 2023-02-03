import boto3
import pandas as pd

# Criar um cliente para interagir com o AWS S3
s3_client = boto3.client('s3')

s3_client.download_file('datalake-rui-igti-edc', 'data/dimensao_mesorregioes_br.csv', 'data/dim-mesorregioes-py.csv')

df = pd.read_csv('data/dim-mesorregioes-py.csv', sep=';')
print(df)

s3_client.upload_file('data/pnad_ipea_2022.csv', 'datalake-rui-igti-edc', 'data/pnad_ipea_2022.csv')