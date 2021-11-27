FROM debian
RUN apt-get update && apt-get install -y \
  default-jre \
  wget \
  novnc \
  python3-websockify \
  fuse
RUN mkdir /verbs
WORKDIR /root
ENV BROADCAST_IP 192.168.1.255
COPY startup.sh .
RUN wget https://github.com/runelite/launcher/releases/latest/download/RuneLite.AppImage
RUN touch log.log
RUN chmod 755 *.sh
RUN chmod 755 *.AppImage
RUN ./RuneLite.AppImage
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD [ "/root/startup.sh" ]
