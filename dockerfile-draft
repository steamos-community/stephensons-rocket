FROM ubuntu:trusty
MAINTAINER Wouter Wijsman a.k.a. Shark <wwijsman@live.nl>

RUN apt-get update
RUN apt-get install wget rsync syslinux p7zip-full realpath xorriso git -y
RUN git clone --progress --depth 1 https://github.com/directhex/steamos-installer.git 
RUN wget --directory-prefix=./steamos-installer http://repo.steampowered.com/download/SteamOSDVD.iso
