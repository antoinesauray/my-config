# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.gem/ruby/2.4.0/bin
export EDITOR=vi
export DEFAULT_USER=macbook

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_TMUX_AUTOSTART='true'
plugins=(
  git
  dotenv
  tmux
)
#ZSH_THEME="michelebologna"
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
alias gpfl="git push --force-with-lease"
alias vim=nvim
alias vi=nvim

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M  -Duser.timezone=GMT"
#export FZF_DEFAULT_COMMAND='ag -l -g ""'

# added by travis gem
[ -f /home/antoine/.travis/travis.sh ] && source /home/antoine/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/antoine/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/antoine/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/antoine/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/antoine/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/antoinesauray/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/antoinesauray/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/antoinesauray/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/antoinesauray/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
eval "$(rbenv init -)"

export PATH="/usr/local/opt/mysql-client/bin:$PATH"

source $HOME/.profile
