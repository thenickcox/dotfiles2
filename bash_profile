source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/history_config

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Enable RVM
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

export TERM='xterm-256color'

eval "$(tmuxifier init -)"

export NVM_DIR="/Users/nick/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# Tidy for Mac OS X by balthisar.com is adding the new path for Tidy.
export PATH=/usr/local/bin:$PATH


