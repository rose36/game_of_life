FROM ubuntu:18.04

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install wget -y && apt-get install curl -y && apt-get install git -y
RUN wget https://golang.org/dl/go1.15.3.linux-amd64.tar.gz
RUN sha256sum go1.15.3.linux-amd64.tar.gz
RUN tar -xvf go1.15.3.linux-amd64.tar.gz -C /usr/local
RUN chown -R root:root /usr/local/go

ENV GOPATH=$HOME/go
ENV PATH=$PATH:$GOPATH/bin
ENV PATH=$PATH:$GOPATH/bin:/usr/local/go/bin
ENV APP_HOME $GOPATH/src/game_of_life

RUN go version

RUN git clone https://github.com/rose36/game_of_life.git $APP_HOME

CMD go run $APP_HOME/game_of_life.go
