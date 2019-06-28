# base image
# FROM ubuntu:16.04
FROM continuumio/anaconda:latest

# set partition and working directory
VOLUME /corpora
VOLUME /opt
WORKDIR /opt

# install base system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         vim \
         wget \
         ca-certificates \
         sox \
         python3 \
         python3-dev \
         python3-pip \
         python3-setuptools \
         libsox-dev \
         libsox-fmt-all

# install TA-Lib
# ARG talib_fn=ta-lib-0.4.0-src.tar.gz
# RUN wget http://prdownloads.sourceforge.net/ta-lib/${talib_fn} && \
#     tar -xzf ${talib_fn} && \
#     cd ta-lib && \
#     ./configure --prefix=/usr && \
#     make && \
#     make install

# install python libraries
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r /tmp/requirements.txt

# install jupyter extensions
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user

# container entry point
ENTRYPOINT ["/bin/bash"]
