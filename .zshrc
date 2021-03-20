# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="aussiegeek"

# Aliases
alias l="ls -Afhl -g --color"
alias e="emacs --no-window-system --quick"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias mm="make --file makefile"
alias hist="history -f"


# Git specific aliases
alias gclear='git checkout -- .'
alias gcleanup='git clean -x -d -ff'
alias gs='git status'
alias grefreshbranches='git remote update origin --prune'
alias gmerge='git merge --no-ff'

# Adding local bin directory to PATH for utilities
export PATH=$PATH:/usr/local/bin:$HOME/bin:$HOME/Work/flutter/bin

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# History settings
export HISTSIZE=100000
export SAVEHIST=100000
export HISTTIMEFORMAT="%d/%m/%y %T "

# Editor settings
export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs"
