# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# include .cargo/env if it exists
if [ -f "$HOME/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
fi

# include .poetry/env if it exists
if [ -f "$HOME/.poetry/env" ] ; then
  . "$HOME/.poetry/env"
fi

# set GPG_TTY
export GPG_TTY=$(tty)

# Default apps
export BROWSER=brave
export TERMINAL=alacritty
export EDITOR=nvim

# NNN configuration
export NNN_OPTS="ea"
export NNN_PLUG="m:nmount;p:preview-tui;n:nuke"
