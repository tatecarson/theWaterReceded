# Rhizome webserver

Setup for and the water receded web server

## Dependencies

* docker

## Local setup

### Build

`docker build -t waters .`

### Run

Make sure no old containers are running from previous builds. 

`docker run --rm -d -p 8000:8000 -p 9000:9000 waters:latest`

## Deploy

