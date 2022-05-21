# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Path to current version of Swift
SWIFT=/home/joshua/Work/swift/swift-5.3.3-RELEASE-ubuntu20.04
ANDROID_PLATFORM=/home/joshua/Android/Sdk/platform-tools
FLUTTER=$HOME/Work/flutter/bin

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
export PATH=$PATH:/usr/local/bin:$HOME/bin:$SWIFT/usr/bin:$ANDROID_PLATFORM:$FLUTTER

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git lpass)

source $ZSH/oh-my-zsh.sh

# History settings
export HISTSIZE=100000
export SAVEHIST=100000
export HISTTIMEFORMAT="%d/%m/%y %T "
