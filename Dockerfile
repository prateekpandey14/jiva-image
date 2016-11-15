FROM ubuntu:latest
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN apt-get update
RUN apt-get install -y git 
RUN git clone https://github.com/golang/go.git
