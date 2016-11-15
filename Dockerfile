FROM ubuntu:16.04
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN apt-get update
RUN apt-get install -y git automake gcc

ENV GOLANG_VERSION 1.7.3
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 508028aac0654e993564b6e2014bf2d4a9751e3b286661b0b0040046cf18028e

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
	&& echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
	&& tar -xzf golang.tar.gz \
&& rm golang.tar.gz

Run mkdir Openebs
RUN cd Openebs ;\
git clone https://github.com/openebs/gotgt gotgt 
RUN export GOROOT=`pwd`/golang ;\
export GOPATH=`pwd`/Openebs;\
export PATH=$PATH:$GOROOT/bin;\
cd Openebs/gotgt; ./autogen.sh; ./configure; make
