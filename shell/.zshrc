export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="af-magic"
plugins=(git github)
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="/usr/local/bin:$PATH"
export PATH="/snap/bin:$PATH"
export EDITOR=vim

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'

# added by travis gem
[ -f /home/ovaube/.travis/travis.sh ] && source /home/ovaube/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
