#!/bin/sh

get_number_of_functions_deployed() {
    aws configure set aws_access_key_id ''
    aws configure set aws_secret_access_key ''
    aws configure set region 'eu-west-2'
    aws configure set output 'json'
    count= aws lambda list-functions --endpoint-url=http://localstack:4574 | jq '.[] | length'
    return ${count}
}

TIMEOUT=60
SECONDS=0
while (($SECONDS < $TIMEOUT)); do
    count=$(get_number_of_functions_deployed)
    if [[ ${count} == 1 ]]; then
        sleep 5 # This is very dumb
        pytest -s --verbose .
        if [[ ! $? == 0 ]]; then
            exit 1
        fi
        exit 0
    fi
    echo "Waiting for deployment to finish, seconds = ${SECONDS}"
done

echo "Timed out waiting for deployment to finish"
exit 1
