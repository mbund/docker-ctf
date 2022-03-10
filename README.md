# docker-ctf
Ubuntu based Docker container for playing CTFs

## Installation and usage
Build the docker container
```
git clone https://github.com/mbund/docker-ctf
cd docker-ctf
docker build -t ctf --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .
```

Run the docker container, and mount the current working directory into `/ctf`
```
docker run --rm --volume $PWD:/ctf --workdir /ctf --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
```

Connect to the docker container
```
docker exec -it ctf /bin/zsh
```

The docker container has a user `user` with the same permissions as the host user, so that you don't have to `chown` all the time (the default docker user is `root` and pollutes mounted volumes). Extra dependencies not included in `apt` are installed into `/home/user/tools` (such as `pwndbg`).
