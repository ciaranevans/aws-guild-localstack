import boto3


def handler(event, context):
    date = event['date']

    s3 = boto3.client('s3',
                      aws_access_key_id='',
                      aws_secret_access_key='',
                      region_name='eu-west-2',
                      endpoint_url='http://172.17.0.1:4572')

    s3.put_object(
        Bucket='guild-bucket',
        Key='guild-object',
        Body='Hello Guild!'
    )

    return ""
