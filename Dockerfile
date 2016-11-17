FROM ubuntu:16.04
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN apt-get update
RUN apt-get install -y git automake gcc curl make apt-transport-https ca-certificates

ENV GOLANG_VERSION 1.7.3
ENV GOLANG_DOWNLOAD_URL https://golang.org/dl/go$GOLANG_VERSION.linux-amd64.tar.gz
ENV GOLANG_DOWNLOAD_SHA256 508028aac0654e993564b6e2014bf2d4a9751e3b286661b0b0040046cf18028e

RUN curl -fsSL "$GOLANG_DOWNLOAD_URL" -o golang.tar.gz \
	&& echo "$GOLANG_DOWNLOAD_SHA256  golang.tar.gz" | sha256sum -c - \
	&& tar -xzf golang.tar.gz \
&& rm golang.tar.gz

# Docker Install
RUN apt-get update ;\
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D ;\
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list ;\
apt-get update ;\
apt-cache policy docker-engine ;\
apt-get install -y docker-engine ;\
systemctl status docker ;\
docker info

RUN mkdir -p `pwd`/src/github.com/openebs/
RUN cd `pwd`/src/github.com/openebs/ ;\
git clone https://github.com/openebs/longhorn.git
RUN export GOROOT=`pwd`/go ;\
export PATH=$PATH:/usr/local/go/bin ;\
export GOPATH=`pwd`/src/github.com/openebs ;\
export PATH=$PATH:$GOROOT/bin;\
mkdir -p `pwd`github.com/rancher/trash ;\
cd `pwd`/src/github.com/openebs/longhorn ;\
go get github.com/rancher/trash .;\
trash . ;\
make
