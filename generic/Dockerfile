FROM ubuntu:jammy

SHELL ["/bin/bash", "-c"]

RUN set -euxo pipefail; \
    apt-get -y update; \
    apt-get -y dist-upgrade; \
    DEBIAN_FRONTEND=noninteractive apt-get -y install \
      curl \
      fonts-ipaexfont \
      fonts-ipafont \
      git-core \
      mesa-utils \
      novnc \
      x11vnc \
      xfonts-base \
      xvfb; \
    apt-get -y clean && rm -rf /var/lib/apt/lists/*; \
    useradd -ms /bin/bash ubuntu

WORKDIR /root

RUN set -euxo pipefail; \
    curl https://mise.run | bash; \
    export PATH="$HOME/.local/bin:$PATH"; \
    echo 'export PATH="$HOME/.local/share/mise/shims:$PATH"' >> ~/.bash_profile; \
    export PATH="$HOME/.local/share/mise/shims:$PATH"; \
    mise use -g python@latest; \
    hash -r; \
    python3 -m pip install pipx; \
    python3 -m pipx ensurepath; \
    hash -r; \
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc; \
    export PATH="$HOME/.local/bin:$PATH"; \
    hash -r; \
    python3 -m venv .venv; \
    . .venv/bin/activate; \
    python3 -m pip install git+https://github.com/Apricot-S/majsoulrpa.git; \
    playwright install --with-deps chromium; \
    deactivate; \
    mkdir .vnc
