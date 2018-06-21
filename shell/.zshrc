export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git github nyan)
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="/usr/local/bin:$PATH"
export PATH="/meida/dev/arcadia:$PATH"
export EDITOR=vim

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'

# OPAM configuration
. /home/ovaube/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
