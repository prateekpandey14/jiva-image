FROM ubuntu:16.04
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN apt-get update
RUN apt-get install -y git automake gcc
RUN git clone https://github.com/golang/go.git
Run mkdir Openebs
RUN cd Openebs ;\
git clone https://github.com/openebs/gotgt gotgt 
RUN export GOROOT=go ;\
export GOPATH=Openebs;\
export PATH=$PATH:$GOROOT/bin;\
cd Openebs/gotgt; ./autogen.sh; ./configure; make
