#!/bin/bash

docker build --tag=openvino_base .
docker build --tag=openvino_cv -f Dockerfile.cv .
