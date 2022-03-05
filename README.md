# docker-ctf
Ubuntu based Docker container for playing CTFs

## Installation and usage
Build the docker container
```
git clone https://github.com/mbund/docker-ctf
cd docker-ctf
docker build -t ctf .
```

Run the docker container, and mount the current working directory into `/ctf`
```
docker run --rm -v $PWD:/ctf --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
```

Connect to the docker container
```
docker exec -it ctf /bin/zsh
```
