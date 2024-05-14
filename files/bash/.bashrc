case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PS1='\W\$ '

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

alias tx="tmux"
alias tl="tmux list-sessions"
alias tn="tmux new -d -s"
alias ta="tmux attach-session -t"
alias st="git st"
alias lg="git lg"
alias all="git add -A"
alias add.="git add ."
alias cm="git commit -m"
alias psh="git push"
alias gpush='git push -u origin $(git branch  | grep ^\* | grep -oP "\w.+" --color=none)'
alias gpull="git fetch && git fetch --prune && git pull"
alias dffs="git diff --staged"
alias dff="git diff"
alias nb="git checkout -b"
alias t="tree --gitignore -a -L"
alias r="trash"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -n "$VENV" ]; then
  source $VENV/bin/activate;
fi
