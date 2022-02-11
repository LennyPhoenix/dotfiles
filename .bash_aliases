# ~/.bash_aliases

# Explore the AUR with FZF
alias lsyay="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -Sy"

# Activate a Python venv
alias venv="source .env/bin/activate"
