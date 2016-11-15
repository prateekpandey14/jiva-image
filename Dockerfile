FROM ubuntu:16.04
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN apt-get update
RUN apt-get install -y git automake
RUN git clone https://github.com/golang/go.git
RUN export GOROOT=$HOME/go ;\
export GOPATH=$HOME/openebs;\
export PATH=$PATH:$GOROOT/bin
Run mkdir Openebs
RUN cd Openebs ;\
git clone https://github.com/openebs/gotgt gotgt 
RUN cd Openebs/gotgt; ./autogen.sh; ./configure
RUN make
