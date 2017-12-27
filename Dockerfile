FROM ubuntu:16.04
RUN apt-get update \
 && apt-get install -y unzip wget \
 && apt-get clean && mkdir /gunbot
WORKDIR /gunbot
ARG GUNBOT_VERSION=702
ARG PORT=5000

RUN wget https://github.com/GuntharDeNiro/BTCT/releases/download/$GUNBOT_VERSION/Gunbot.XT.Edition.-.Linux.package.zip -O gunbot.zip \
 && unzip gunbot.zip \
 && rm gunbot.zip
 && mv Gunbot\ XT\ Edition\ -\ Linux\ package/* . \
 && rm -rf Gunbot\ XT\ Edition\ -\ Linux\ package/ \
 && chmod +x gunthy-*

VOLUME /gunbot/config.js
VOLUME /gunbot/db.sqlite
CMD ./gunthy-gui-linx64