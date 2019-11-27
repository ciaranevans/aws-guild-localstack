import json
from datetime import datetime
from unittest import TestCase

import boto3


def invoke_function(date):
    lambda_client = boto3.client('lambda',
                                 aws_access_key_id='',
                                 aws_secret_access_key='',
                                 region_name='eu-west-2',
                                 endpoint_url='http://localstack:4574')
    lambda_client.invoke(
        FunctionName='guild-function',
        InvocationType='RequestResponse',
        Payload=json.dumps({'date': date})
    )


def get_s3_object_contents():
    s3 = boto3.client('s3',
                      aws_access_key_id='',
                      aws_secret_access_key='',
                      region_name='eu-west-2',
                      endpoint_url='http://localstack:4572')

    return s3.get_object(
        Bucket='guild-bucket',
        Key='guild-object'
    )['Body'].read().decode('utf-8')


class Test(TestCase):
    def test_that_fails(self):
        date_today = str(datetime.now())
        invoke_function(date_today)
        contents = get_s3_object_contents()
        expected_message = 'Hello Guild! It\'s: {0}'.format(date_today)
        self.assertEqual(contents, expected_message, 'S3 Object contained the wrong thing')
