Output docs/usage.gif
Set Width 1920
Set Height 1080
Set Framerate 50

Require podman

Set TypingSpeed 150ms
Type "podman exec -it ctf zsh" Enter Sleep 1s
Type "ls" Enter Sleep 1s
Sleep 2s
Type "tmux -2" Enter Sleep 1s
Ctrl+b Type "%" Sleep 1s

Ctrl+b Type "h" Sleep 1s
Type "hx solve.py" Enter Sleep 1s
Sleep 4s
Type "23j" Sleep 1s
Set TypingSpeed 400ms
Type "o" Escape Type "o" Sleep 1s
Type "r.sendl" Sleep 5s Tab Sleep 1s
Type '(b"ABCDEF"' Sleep 1s
Escape Type ":w" Enter Sleep 1s

Set TypingSpeed 150ms
Ctrl+b Type "l" Sleep 1s
Type "./solve.py LOCAL GDB DEBUG" Enter Sleep 1s
Sleep 4s
Set TypingSpeed 400ms
Type "reg" Sleep 1s Enter Sleep 1s
Sleep 4s
Type "c" Sleep 1s Enter Sleep 1s
Sleep 1s
Ctrl+d Sleep 1s Ctrl+d Sleep 1s

Sleep 4s
Type "🎉"
Sleep 12s
