# Update PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.local/share/gem/ruby/3.0.0/bin" ] ; then
    PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
fi

if [ -f "$HOME/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
fi

if [ -f "$HOME/.poetry/env" ] ; then
  . "$HOME/.poetry/env"
fi

if [ -f "$HOME/.ghcup/env" ] ; then
  . "$HOME/.ghcup/env"
fi

# GPG setup
export GPG_TTY=$(tty)

# Default apps
export BROWSER=brave
export TERMINAL=alacritty
export EDITOR=nvim

# NNN configuration
export NNN_OPTS="ea"
export NNN_PLUG="m:nmount;p:preview-tui;n:nuke"

# GTK
export GTK_THEME=Dracula

# QT
export QT_STYLE_OVERRIDE=kvantum
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_ENABLE_HIGHDPI_SCALING=1
