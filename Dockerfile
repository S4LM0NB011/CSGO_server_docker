FROM ubuntu:18.04
LABEL maintainer="mattias.coelho@gmail.com"
LABEL description="This is my attempt to create a dockerfile to run a csgo server with LGSM, sourcemod, metamod and pugsetup"

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
RUN apt install steamcmd -y
USER csgoserver
RUN wget -O linuxgsm.sh https://linuxgsm.sh \
	&& chmod +x linuxgsm.sh \
	&& bash linuxgsm.sh csgoserver \
	&& ./csgoserver install

EXPOSE 27015
