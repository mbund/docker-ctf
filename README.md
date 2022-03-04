# docker-ctf
Ubuntu based Docker container for playing CTFs

Some useful docker commands:
```
$ docker build -t ctf .
```
```
$ docker run --rm -v $PWD:/ctf --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name ctf -i ctf
```
```
$ docker exec -it ctf /bin/zsh
```

