#!/bin/sh

build_function() {
    cd /build/lambda
    chmod -R 755 *
    ./build.sh
    chmod 664 guild-function.zip
}

run_terraform() {
    cd /build/deployment
    terraform init
    terraform apply --auto-approve
}

build_function
run_terraform
