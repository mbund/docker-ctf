# docker-ctf

Ubuntu based container for playing CTFs. Recommended that you use `podman` for correct user permissions so you can use the mounted filesystem seemlessly.

## Run

```
podman run -d --name ctf -v $PWD:/root/ctf ghcr.io/mbund/docker-ctf:latest
podman exec -it ctf zsh
```

## Maintaining

The image is updated weekly automatically (Thursdays at midnight UTC).
