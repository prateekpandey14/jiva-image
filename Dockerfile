FROM ubuntu:latest
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN apt-get update
RUN go get github.com/golang/go
