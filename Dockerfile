FROM drydock/u16all:master

ADD . /u16javall

RUN /u16javall/install.sh
