# docker-ctf
Ubuntu based container for playing CTFs. Recommended that you use `podman` for correct user permissions so you can use the mounted filesystem seemlessly.

## Quickstart
Docker image size is ~2GiB download.
```
podman run --rm -v $PWD:/ctf -w /ctf -it mbund/ctf zsh
```

## Build
You might want to build it yourself to avoid downloading as much.
```
podman build -t ctf https://github.com/mbund/docker-ctf.git
```
