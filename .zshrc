# General
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt extendedglob nomatch notify
unsetopt autocd beep

# Keybinds
bindkey -v

# for linux console and RH/Debian xterm
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[5~' beginning-of-history
bindkey '\e[6~' end-of-history
bindkey '\e[7~' beginning-of-line
bindkey '\e[3~' delete-char
bindkey '\e[2~' quoted-insert
bindkey '\e[5C' forward-word
bindkey '\e[5D' backward-word
bindkey '\e\e[C' forward-word
bindkey '\e\e[D' backward-word
bindkey '\e[1;5C' forward-word
bindkey '\e[1;5D' backward-word

# for rxvt
bindkey '\e[8~' end-of-line

# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey '\eOH' beginning-of-line
bindkey '\eOF' end-of-line

# for freebsd console
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

# Enabled COLOUR!
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Aliases
alias ll='ls -lF'
alias lla='ls -alF'
alias la='ls -AF'
alias l='ls -CF'

alias lsyay="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -Sy"
alias tdrop="tdrop -w $(expr $(xrandr --current | grep '*' | uniq | awk '{print $1}' | cut -d 'x' -f1) - 4)"
alias clipscrot="scrot /tmp/ -e 'xclip -selection clipboard -target image/png -i \$f'"

# Compinstall
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

# Starship
eval "$(starship init zsh)"
