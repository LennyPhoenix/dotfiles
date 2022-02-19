# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

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

# set TERMINAL
export TERMINAL=alacritty

# set EDITOR
export EDITOR=nvim

# set ALTERNATE_EDITOR
export ALTERNATE_EDITOR=emacs

export QT_STYLE_OVERRIDE=kvantum
