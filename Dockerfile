FROM debian
RUN apt-get update && apt-get install -y \
  flatpak \
  wget \
  novnc \
  python3-websockify \
  x11vnc \
  xdotool \
  xvfb
RUN flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo && \
  flatpak install flathub -y \
  net.runelite.RuneLite \
  com.adamcake.Bolt
VOLUME ["/root/.runelite"]
VOLUME ["/root/jagexcache"]
WORKDIR /root
ENV JAGEX_ACC True
ENV PASSWORD 1234
ENV SCREENSIZE 1280x800x24
ENV DISPLAY :20
COPY startup.sh .
COPY start-rl.sh .
COPY stop-rl.sh .
RUN mkdir /root/.vnc
RUN openssl req -x509 -nodes -newkey rsa:3072 -keyout novnc.pem -out novnc.pem -days 3650 -subj '/CN=localhost/O=Corp/C=EU'
RUN ln /usr/share/novnc/vnc.html /usr/share/novnc/index.html
RUN chmod 755 *.sh
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
EXPOSE 6080/tcp
CMD [ "/root/startup.sh" ]
