FROM ubuntu:latest
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN sudo apt-get update
RUN sudo apt-get install git 
RUN git clone https://github.com/golang/go.git
