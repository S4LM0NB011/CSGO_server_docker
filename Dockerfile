FROM ubuntu:18.04
LABEL maintainer="mattias.coelho@gmail.com"
LABEL description="This is my attempt to create a dockerfile to run a csgo server with LGSM, sourcemod, metamod and pugsetup"

ENV DEBIAN_FRONTEND noninteractive

RUN dpkg --add-architecture i386
RUN apt update && \
	apt install -y --no-install-recommends --no-install-suggests \
		mailutils \
		postfix \
		curl \
		wget \
		file \
		tar \
		bzip2 \
		gzip \
		unzip \
		bsdmainutils \
		python \
		util-linux \
		ca-certificates \
		binutils \
		bc \
		jq \
		tmux \
		lib32gcc1 \
		libstdc++6 \
		lib32stdc++6
WORKDIR home/csgoserver
RUN wget -O linuxgsm.sh https://linuxgsm.sh && \
    chmod +x linuxgsm.sh && \
    chmod -R a+rwx /home/csgoserver/
RUN useradd -g root -G sudo csgoserver
USER csgoserver


#RUN apt install steamcmd -y

RUN  bash linuxgsm.sh csgoserver
RUN ./csgoserver ai
WORKDIR home/csgoserver/serverfiles/csgo
RUN wget https://mms.alliedmods.net/mmsdrop/1.10/mmsource-1.10.7-git971-linux.tar.gz \
        https://sm.alliedmods.net/smdrop/1.10/sourcemod-1.10.0-git6490-linux.tar.gz




EXPOSE 27015/tcp 27015/udp 27020/udp
