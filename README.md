Ubuntu based container for playing CTFs. Recommended that you use `podman` for correct user permissions so you can use the mounted filesystem seemlessly.

## Features

- tools like pwntools, pwninit, etc. and 32-bit x86 support
- zsh with autocomplete and more
- gdb with [gef](https://github.com/hugsy/gef)
- [tmux](https://github.com/gpakosz/.tmux) configuration
- [helix](https://github.com/helix-editor/helix) editor (with LSP built in)
- automatic updates weekly (Thursdays at midnight UTC)

![usage video](docs/usage.mov)

## Run

```
podman run -d --name ctf -v $PWD:/root/ctf ghcr.io/mbund/ctf:latest
podman exec -it ctf zsh
```
