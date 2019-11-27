# How Data Engineering use LocalStack for AWS Development λ ☁ 🛠

## What's this?

This repo contains an example project which is similar in structure to `UKHO/s2-classification-lambda-pipeline`

To try this example, checkout the project, go to the repo base and then run:

`./run_demo.sh`

## What's happening?

1. `docker-compose` is building the required images (Dockerfile-TF for deploying to LocalStack, Dockerfile-Tests for
running tests against LocalStack)
2. `TMPDIR=/private$TMPDIR docker-compose run testing` is running this whole show
    1. `Dockerfile-TF` runs a script that packages the function up into a .zip and then
    runs the Terraform scripts
    2. `Dockerfile-Tests` runs a script that waits for the function to be deployed, then it runs
    the associated tests
