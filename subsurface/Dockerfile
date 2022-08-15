FROM ubuntu:jammy
ENV CODENAME xenial
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get update && apt-get install -y \
	build-essential \
	wget \
	software-properties-common

RUN add-apt-repository ppa:subsurface/subsurface
RUN echo deb-src https://ppa.launchpadcontent.net/subsurface/subsurface/ubuntu/ jammy main |tee -a /etc/apt/sources.list.d/subsurface-ubuntu-subsurface-jammy.list
RUN apt-get update
RUN apt-get install -y asciidoc debhelper libgconf2-dev libtool libxml2-dev libxslt-dev libsoup2.4-dev pkg-config txt2html libzip-dev libsqlite3-dev autoconf automake cmake libusb-1.0-0-dev libbluetooth-dev libmtp-dev dh-autoreconf libz-dev libssl-dev libssh2-1-dev git qttools5-dev-tools qt5-qmake libqt5svg5-dev libqt5webkit5-dev qtscript5-dev qttools5-dev qtlocation5-dev qtpositioning5-dev qml-module-qtpositioning qml-module-qtlocation qml-module-qtquick2 libcurl4-openssl-dev qtconnectivity5-dev subsurface-qt-private-headers

RUN echo deb http://archive.ubuntu.com/ubuntu/ bionic-updates main restricted |tee -a /etc/apt/sources.list.d/bionic-updates.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32 && \
	apt-get update
RUN apt-get install -t bionic-updates -y --allow-downgrades linux-libc-dev=4.15.0-191.202

RUN mkdir /build
VOLUME /build
WORKDIR /build/

CMD cd /build && \
	apt-get source subsurface && \
	cd subsurface-5.0.9 && \
        dpkg-buildpackage -b

# RUN cd subsurface-5.0.9 && dpkg-buildpackage -b
