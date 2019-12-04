FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install bzr build-essential automake libboost-dev libxml2-dev libftgl-dev libglew-dev bison pkg-config autoconf autotools-dev protobuf-compiler screen nano libxml2

WORKDIR /home/root
RUN bzr branch lp:~armagetronad-ap/armagetronad/0.2.9-armagetronad-sty+ct+ap
WORKDIR /home/root/0.2.9-armagetronad-sty+ct+ap
RUN ./bootstrap.sh
RUN mkdir /home/root/armagetronad
RUN CXXFLAGS="-O0" ./configure --enable-dedicated --enable-authentication --prefix=/home/root/armagetronad/ --exec_prefix=/home/root/armagetronad/
RUN make && make install
RUN mkdir /home/root/armagetronad/servers

ARG servername_arg=sumobarsmart
ENV servername=${servername_arg}

RUN mkdir /home/root/armagetronad/servers/${servername_arg}
RUN mkdir /home/root/armagetronad/servers/${servername_arg}/scripts
RUN mkdir /home/root/armagetronad/servers/${servername_arg}/settings
RUN mkdir /home/root/armagetronad/servers/${servername_arg}/var
RUN mkdir /home/root/armagetronad/servers/${servername_arg}/logs

# I'm not sure why it was suggested to add the line below, so I'm leaving it out for now but keeping it in case something breaks
# RUN cp -r /home/root/armagetronad/etc/games/armagetronad-dedicated /home/root/armagetronad/servers/sumobarsmart/settings

RUN touch /home/root/armagetronad/servers/${servername_arg}/command.txt && touch /home/root/armagetronad/servers/$servername/console.txt

COPY settings_custom.cfg /home/root/armagetronad/servers/${servername_arg}/settings
COPY server_info.cfg /home/root/armagetronad/servers/${servername_arg}/settings

COPY server_scripts /home/root/armagetronad/servers/${servername_arg}/scripts
RUN chmod -R +x /home/root/armagetronad/servers/${servername_arg}/scripts

WORKDIR /home/root/armagetronad/servers/${servername_arg}/scripts

ENTRYPOINT ["./server.sh", "sumosmart"]
