#!/bin/sh
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZPLUG_HOME=/usr/local/opt/zplug

source $ZPLUG_HOME/init.zsh

# list of plugins
zplug "mafredri/zsh-async", from:github, defer:0 # perform shell commands in async mode
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # shell realtime syntax highlighter
zplug "zsh-users/zsh-history-substring-search" # fish shell's history search feature
zplug "plugins/git-extras", from:oh-my-zsh # autocompletion for git-extras commands
zplug "plugins/npm", from:oh-my-zsh # autocompletion for npm
zplug "plugins/pod", from:oh-my-zsh # autocompletion for cocoapods
zplug "plugins/web-search", from:oh-my-zsh # adds commends to do web search (google, bing, ddg)
zplug "plugins/mvn", from:oh-my-zsh # autocompletion for maven
zplug "plugins/autojump", from:oh-my-zsh # enables autojump if installed
zplug "lib/completion", from:oh-my-zsh # load completion library for those sweet [tab] squares

# set theme
zplug "themes/agnoster", from:oh-my-zsh, as:theme
# zplug 'dracula/zsh', as:theme

# manage zplug itself as a plugins
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

# sorce my shell scripts
shell_setup=~/.shell-setup.sh
if [ -e $shell_setup ]; then
  source $shell_setup
fi