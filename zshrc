# Path to your oh-my-zsh configuration.
ZSH=$HOME/.dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"

# Never know when you're gonna need to popd!
setopt AUTO_PUSHD

# Allow completing of the remainder of a command
bindkey "^N" insert-last-word

# Save a ton of history
HISTSIZE=20000
HISTFILE=~/.zsh_history
SAVEHIST=20000

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

DISABLE_CORRECTION="true"
unsetopt correct

EDITOR=vim
export EDITOR

# Use emacs mode for Ctrl + A, Ctrl + E
set -o emacs

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

# RVM
# [[ -s "/Users/ben/.rvm/scripts/rvm" ]] && source "/Users/ben/.rvm/scripts/rvm"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rvm)

source ~/.dotfiles/oh-my-zsh/oh-my-zsh.sh

export PATH=/usr/local/bin:$PATH

# Source my custom files after oh-my-zsh so I can override things.
source ~/.dotfiles/zsh/aliases
source ~/.dotfiles/zsh/functions

# Shaves about 0.5s off Rails boot time (when using perf patch). Taken from https://gist.github.com/1688857
#export RUBY_GC_HEAP_INIT_SLOTS=1000000
#export RUBY_HEAP_SLOTS_INCREMENT=1000000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=1000000000
#export RUBY_HEAP_FREE_MIN=500000

# Make terminal windows use separate history
unsetopt sharehistory

export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR="/Users/nickcox/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
