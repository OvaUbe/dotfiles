export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom
ZSH_THEME="avit"
plugins=(git github nyan)
. ~/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="~/usr/bin:$PATH"
export EDITOR=vim
export YT_LOG_LEVEL=INFO

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'

autoload bashcompinit && bashcompinit && . ~/usr/share/bash_completion.d/yt_completion

source /home/vvgolubev/.yql/shell_completion
