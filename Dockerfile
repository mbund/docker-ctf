FROM ubuntu:20.04

# Don't ever ask anything on docker build
ARG DEBIAN_FRONTEND=noninteractive

ARG USER_ID
ARG GROUP_ID

RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install -y \
        sudo git jq vim ssh netcat tmux binutils binwalk htop \
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

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
RUN usermod -aG sudo user
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER user

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/home/user/.cargo/bin:${PATH}"
RUN cargo install pwninit

RUN pip3 install --upgrade pip
RUN pip3 install pwntools keystone-engine unicorn==1.0.3 capstone ropper autopep8 && \
    cd /home/user && mkdir tools && cd tools && \
    git clone https://github.com/radare/radare2 && cd radare2 && sys/install.sh && cd .. && \
    git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && cd .. && \
    git clone https://github.com/mariuszskon/autorop && cd autorop && pip install . && cd .. && \
    cd ..

ENV PATH="/home/user/.local/bin:${PATH}"

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -- \
    -t robbyrussell \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting

