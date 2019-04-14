export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.zsh-custom
ZSH_THEME="af-magic-with-mercurial"
plugins=(git github mercurial)
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME="$HOME/.config"
export PATH="/usr/local/bin:$PATH"
export PATH="/media/dev/arcadia:$PATH"
export PATH="/snap/bin:$PATH"
export EDITOR=vim
export YT_LOG_LEVEL=INFO

alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias mkdir='mkdir -pv'

autoload bashcompinit && bashcompinit && . /etc/bash_completion.d/yt_completion

source /home/vvgolubev/.yql/shell_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
