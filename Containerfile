FROM docker.io/ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && apt-get update && apt-get upgrade -y

RUN apt-get install -y git jq vim ssh openssh-server netcat tmux binutils binwalk htop zsh procps strace ltrace curl \
  wget rubygems dnsutils netcat nmap whois net-tools iputils-ping gcc gcc-multilib make build-essential pkg-config \
  patchelf elfutils gdb gdb-multiarch gdb-multiarch libc6:i386 libncurses5:i386 libstdc++6:i386 libssl-dev libffi-dev \
  libpcre3-dev libdb-dev libxt-dev libxaw7-dev liblzma-dev python3 python3-pip python3-dev sqlmap steghide \
  openssh-server libgmp3-dev libmpc-dev
RUN gem install one_gadget
RUN pip3 install --upgrade pip
RUN pip3 install pwntools keystone-engine unicorn capstone ropper autopep8 python-lsp-server

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
ENV PATH="/root/.local/bin:${PATH}"

RUN cargo install pwninit

RUN mkdir -p /root/tools
RUN cd /root/tools && git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh
RUN cd /root/tools && git clone https://github.com/mariuszskon/autorop && cd autorop && pip install .
RUN cd /root/tools && git clone https://github.com/helix-editor/helix && cd helix && cargo install --locked --path helix-term && \
  mkdir -p ~/.config/helix && ln -s /root/tools/helix/runtime ~/.config/helix/runtime

# zeratool requires radare2 to be installed first
RUN pip3 install zeratool

# install gef (gdb extension)
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
  -t robbyrussell \
  -p git \
  -p https://github.com/zsh-users/zsh-autosuggestions \
  -p https://github.com/zsh-users/zsh-completions \
  -p https://github.com/zsh-users/zsh-syntax-highlighting

RUN cd /root && git clone https://github.com/gpakosz/.tmux && ln -s -f .tmux/.tmux.conf && cp .tmux/.tmux.conf.local .
RUN sed -i "/set -g mouse on/s/^#//g" ~/.tmux.conf.local
RUN echo 'theme = "base16_transparent"\n\n[editor]\ntrue-color = true\nline-number = "relative"\n' > ~/.config/helix/config.toml

RUN chsh -s /bin/zsh

WORKDIR /root/ctf
CMD ["tail", "-f", "/dev/null"]