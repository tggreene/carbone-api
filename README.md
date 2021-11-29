# Carbone API

Embedded Carbone in a Docker image with simple REST API.

## Image from Docker Hub

    docker pull tggreene/carbone-api:3.4.1-1

## Try it out

Build the image

    docker build -t carbone-api .

Run the image

    docker run --rm -it --init -p 3030:80 carbone-api

Run a test curl command

    cd test
    ./test.sh

Inspect the generated sample.pdf

## From carbone.io website

_Fast, Simple and Powerful report generator in any format PDF, DOCX, XLSX, ODT, PPTX, ODS [, ...]_

_... using your JSON data as input._

See [carbone.io website](https://carbone.io) for full **Carbone** documentation.
