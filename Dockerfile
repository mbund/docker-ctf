FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y \
        sudo git jq vim ssh netcat tmux binutils binwalk htop \
        zsh \
        procps \
        strace ltrace \
        curl wget \
        rubygems \
        dnsutils netcat nmap whois net-tools iputils-ping \
        gcc gcc-multilib make build-essential pkg-config \
        patchelf elfutils \
        gdb gdb-multiarch \
        libc6:i386 libncurses5:i386 libstdc++6:i386 \
        libssl-dev libffi-dev libpcre3-dev libdb-dev libxt-dev libxaw7-dev liblzma-dev \
        python3 python3-pip python3-dev \
        sqlmap \
        steghide

RUN gem install one_gadget

ENV PATH="/root/.local/bin:${PATH}"

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo install pwninit

RUN pip3 install --upgrade pip
RUN pip3 install pwntools keystone-engine unicorn==1.0.3 capstone ropper autopep8 python-lsp-server

RUN mkdir -p /root/tools
RUN cd /root/tools && git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh
RUN cd /root/tools && git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh
RUN cd /root/tools && git clone https://github.com/mariuszskon/autorop && cd autorop && pip install .
RUN cd /root/tools && git clone https://github.com/helix-editor/helix && cd helix && cargo install --path helix-term && \
  mkdir -p ~/.config/helix && ln -s /root/tools/helix/runtime ~/.config/helix/runtime

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t robbyrussell \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting
