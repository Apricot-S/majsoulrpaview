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
      gnupg \
      libbz2-dev \
      libffi-dev \
      liblzma-dev \
      libncurses-dev \
      libreadline-dev \
      libsqlite3-dev \
      libssl-dev \
      mesa-utils \
      novnc \
      python3-pip \
      wget \
      x11vnc \
      xfonts-base \
      xvfb; \
    apt-get -y clean && rm -rf /var/lib/apt/lists/*; \
    useradd -ms /bin/bash ubuntu

WORKDIR /root

RUN set -euxo pipefail; \
    curl 'https://pyenv.run' | bash; \
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc; \
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc; \
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc; \
    export PYENV_ROOT="$HOME/.pyenv"; \
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"; \
    eval "$(pyenv init -)"; \
    hash -r; \
    PYTHON_LATEST_VERSION=$(pyenv install -l | sed -e 's/^\s*//' | grep -Eo '^[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+$' | LANG=C sort -Vr | head -n 1); \
    pyenv install $PYTHON_LATEST_VERSION; \
    pyenv global $PYTHON_LATEST_VERSION; \
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
