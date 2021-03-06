# Openvino Docker 
The repo has three docekr files, creating three docker in steps. This helps to create a base docker for OpenVino along with GPU support (Dockerfile). Once this is done, we create a new docker (Docekrfile.cv) with additional requirements, like OpenCV. In this docker file, you can add additional requirements. This helps to keep things modular and managebale. The docker file is based on the the steps mentioned on the [OpenVino Documentation page](https://docs.openvinotoolkit.org/latest/_docs_install_guides_installing_openvino_docker_linux.html)


# Features
 - OpenVino development docker 
 - deployment_tools installed
 - prerequisites for model_optimizer installed
 - c/cpp samples build
 - python3
 - GPU support 
 - OpenCV

## Download pre-requisites 
 ## Openvino Toolkit
 Download the Openvino Toolkit by regstering from  [Openvino download](https://software.intel.com/en-us/openvino-toolkit/choose-download/) site. For this project I had downloaded the *2020.2.120* version. If a newer is avaiable one can download that and make the necessary changes in the **Dockerfile** 
 
 # Build 
 To build the docker(s), run the ```build_docker.sh``` script. This will take some time. 
 # Run
 To run the docker, 
 ```bash
 docker run --rm --it \
        --device /dev/dri \
        -v <path_to_repo>/OpenvinoDocker/.bashrc:/home/openvino/.bashrc \
        --name openvino \
        openvino_cv /bin/bash
 ```
