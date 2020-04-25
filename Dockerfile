#https://docs.openvinotoolkit.org/latest/_docs_install_guides_installing_openvino_docker_linux.html
FROM ubuntu:18.04
USER root
WORKDIR /
RUN useradd -ms /bin/bash openvino && \
    chown openvino -R /home/openvino
ARG INSTALL_DIR=/opt/intel/openvino
ARG DEPENDENCIES="autoconf \
                  automake \
                  build-essential \
                  cmake \
                  cpio \
                  curl \
                  gnupg2 \
                  libdrm2 \
                  libglib2.0-0 \
                  lsb-release \
                  libgtk-3-0 \
                  libtool \
                  python3-pip \
                  python3-dev \
                  sudo \
                  udev \
                  unzip"
RUN apt-get update && \
    apt-get install -y --no-install-recommends ${DEPENDENCIES} && \
    rm -rf /var/lib/apt/lists/*
#ARG DOWNLOAD_LINK=http://registrationcenter-download.intel.com/akdlm/irc_nas/13231/l_openvino_toolkit_p_2019.0.000.tgz
COPY l_openvino_toolkit_p_2020.2.120.tgz /tmp
WORKDIR /tmp
RUN pip3 install setuptools wheel
RUN tar -xzf ./*.tgz && \
    cd l_openvino_toolkit* && \
    sed -i 's/decline/accept/g' silent.cfg && \
    ./install.sh -s silent.cfg --install_dir $INSTALL_DIR && \
    rm -rf /tmp/*

# install dependencies
WORKDIR $INSTALL_DIR/install_dependencies
RUN /bin/bash _install_all_dependencies.sh &&\
    $INSTALL_DIR/deployment_tools/model_optimizer/install_prerequisites/install_prerequisites.sh

USER openvino
# Build Samples
RUN /bin/bash $INSTALL_DIR/inference_engine/samples/c/build_samples.sh && \
    /bin/bash $INSTALL_DIR/inference_engine/samples/cpp/build_samples.sh 

ENV INSTALLDIR /opt/intel/openvino
