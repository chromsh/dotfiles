PS1="[\[\033[35m\]\u \[\033[31m\]\h \[\033[36;1;4m\]\w\[\033[0m\]]\n\$ "

alias ls='ls -F'
alias sl='ls -F'
alias ll='ls -lF'
alias lt='ll -rt'
alias lls='ll -rSh'
alias llh='ll -h'
alias lr='ll -rt'

alias w='w | sort'
alias l=ll
alias cdo='cd $OLDPWD'
alias dfh='df -h'

alias rmb='rm *~'

alias grep='grep --colour=auto'

alias gcc99='gcc -std=c99'

alias ffprobe="ffprobe -hide_banner"
alias ffmpeg="ffmpeg -hide_banner"

alias delcom='sed -e "/^#/d; /^$/d;"'

alias v="vim"
alias nv="nvim"
alias g="git"
alias gs="git status"
alias gc="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias ga="git add"
alias gp="git pull --prune"

alias e="explorer"

alias d="docker"
alias dc="docker-compose"
alias del-intermediate-images='docker rmi $(docker images -q -f dangling=true)'

shopt -u histappend   # .bash_history追記モードは不要なのでOFFに

HISTSIZE=1000000
HISTFILESIZE=1000000
HISTCONTROL=ignoredups
export HISTSIZE HISTFILESIZE HISTCONTROL
shopt -s no_empty_cmd_completion

HISTTIMEFORMAT='[%Y-%m-%d %T] '; export HISTTIMEFORMAT

# XOFF,XONを無効化 (C-s, C-q)
stty start undef
# disable C-s
if [ -t 0 ]; then
	stty stop undef
fi

shopt -s no_empty_cmd_completion

export LANG=ja_JP.UTF-8
export PAGER="lv -c "
# export VIMRUNTIME=~/squashfs-root/usr/share/nvim/runtime/


# for fzf setup
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# for source management, Ctrl+g
# https://qiita.com/hidache/items/7dbf0eba2f36f5e1a447
function ghql() {
  local selected_file=$(ghq list --full-path | fzf)
  if [ -n "$selected_file" ]; then
    if [ -t 1 ]; then
      echo ${selected_file}
      cd ${selected_file}
      pwd
    fi
  fi
}

# もとは201だが、日本語入力できなくなるので0を足した
#bind -x '"\2010": ghql'
#bind '"\C-g":"\2010\C-m"'
# wsl2で動かなかったので更に変更
bind -x '"\1041": ghql'
bind '"\C-g":"\1041\C-m"'

alias k="kubectl"

. <(kubectl completion bash)
. <(istioctl completion bash)
complete -o default -F __start_kubectl k
