# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export EDITOR=vi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(
  git
  dotenv
)
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'
alias gpfl="git push --force-with-lease"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export SBT_OPTS="-Xmx2G -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=2G -Xss2M  -Duser.timezone=GMT"
export FZF_DEFAULT_COMMAND='ag -l -g ""'

# added by travis gem
[ -f /home/antoine/.travis/travis.sh ] && source /home/antoine/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/antoine/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/antoine/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/antoine/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/antoine/Downloads/google-cloud-sdk/completion.zsh.inc'; fi


# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/antoine/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/antoine/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/antoine/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/antoine/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

