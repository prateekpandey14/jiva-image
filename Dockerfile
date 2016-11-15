FROM ubuntu:latest
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN apt-get update
RUN git clone https://github.com/golang/go.git
