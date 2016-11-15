FROM ubuntu:16.04
MAINTAINER prateek14 <prateek.pandey@cloudbyte.com>
RUN apt-get update
RUN apt-get install -y git 
RUN git clone https://github.com/golang/go.git
RUN mkdir -p $GOPATH/src/github.com/openebs/
RUN cd $GOPATH/src/github.com/openebs/
RUN git clone https://github.com/openebs/gotgt gotgt
RUN cd gotgt; /bin/bash -c ./autogen.sh
RUN cd gotgt; /bin/bash -c ./configure
RUN make
