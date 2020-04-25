#!/bin/bash

docker build --tag=openvino_base .
docker build --tag=openvino_gpu -f Dockerfile.gpu .
docker build --tag=openvino_cv -f Dockerfile.cv .
