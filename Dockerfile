FROM debian
RUN apt-get update && apt-get install -y \
  default-jre \
  wget \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /verbs
WORKDIR /root
ENV BROADCAST_IP 192.168.1.255
COPY startup.sh .
RUN wget https://github.com/runelite/launcher/releases/latest/download/RuneLite.AppImage
RUN touch log.log
RUN chmod 755 *.sh
CMD [ "/root/startup.sh" ]
