#!/bin/bash

docker build . -t tatecarson/the-water-receded
docker push tatecarson/the-water-receded
hyper rm -f the-water-receded
hyper rmi tatecarson/the-water-receded
hyper pull tatecarson/the-water-receded
# hyper run -d --name the-water-receded -p 8000:8000 9000:9000 tatecarson/the-water-receded
hyper run -d --name the-water-receded -P tatecarson/the-water-receded
hyper fip attach 209.177.90.179 the-water-receded