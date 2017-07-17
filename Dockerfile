FROM drydock/u16all:{{%TAG%}}

ADD . /u16javall

RUN /u16javall/install.sh
