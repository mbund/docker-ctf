#!/usr/bin/env python3

from pwn import *

exe = ELF("vuln")

context.binary = exe


def conn():
    if args.LOCAL:
        r = process([exe.path])
        if args.GDB:
            gdb.attach(r, """
            b main
            """)
    else:
        r = remote("addr", 1337)

    return r


def main():
    r = conn()

    r.interactive()


if __name__ == "__main__":
    main()
