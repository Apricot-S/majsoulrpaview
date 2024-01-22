FROM ubuntu

SHELL ["/bin/bash", "-c"]

RUN set -euxo pipefail; \
    apt-get -y update; \
    apt-get -y dist-upgrade; \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
      fonts-ipaexfont \
      fonts-ipafont \
      gnupg \
      mesa-utils \
      novnc \
      wget \
      x11vnc \
      xauth \
      xfonts-base \
      xvfb; \
    wget -qO - 'https://dl-ssl.google.com/linux/linux_signing_key.pub' | apt-key add -; \
    echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google.list; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get -y install google-chrome-stable; \
    apt-get clean && rm -rf /var/lib/apt/lists/*; \
    useradd -ms /bin/bash ubuntu

ENV DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket

USER ubuntu
WORKDIR /home/ubuntu

RUN set -euxo pipefail; \
    touch "$HOME/.Xauthority"; \
    chmod 600 "$HOME/.Xauthority"; \
    mkdir "$HOME/.vnc"