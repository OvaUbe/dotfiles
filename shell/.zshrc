export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom
ZSH_THEME="avit"
plugins=(git github nyan)
. ${HOME}/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="${HOME}/usr/bin:$PATH"
export EDITOR=vim
export TERM=xterm-256color
export YT_LOG_LEVEL=INFO
export LD_LIBRARY_PATH="${HOME}/usr/lib:${LD_LIBRARY_PATH}"

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'

autoload bashcompinit && bashcompinit && . ${HOME}/usr/share/bash_completion.d/yt_completion

source ${HOME}/.yql/shell_completion
