#!/bin/sh
export SHELL=`which zsh`
export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZPLUG_HOME=/usr/local/opt/zplug
if [ ! -d $ZPLUG_HOME ]; then
	ZPLUG_HOME=$HOME/.zplug
fi

source $ZPLUG_HOME/init.zsh

# list of plugins
zplug "lib/completion", from:oh-my-zsh # load completion library for those sweet [tab] squares
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions", defer:0 # cool autocompletion while you are typing command
zplug "zsh-users/zsh-syntax-highlighting", defer:2 # shell realtime syntax highlighter
zplug "zsh-users/zsh-history-substring-search", defer:3 # fish shell's history search feature
zplug "jocelynmallon/zshmarks" # tool to jump around directories using bookmarks
zplug "Tarrasch/zsh-bd" # quickly go back to a specific parent directory with bd command
zplug "mollifier/cd-gitroot" # quickly cd to git repo root directoty
zplug "plugins/colored-man-pages", from:oh-my-zsh # adds more colors to man pages
zplug "jsks/czhttpd" # simple http server in pure zsh with czhttpd command
zplug "wfxr/forgit", defer:1 # adds few interactive commands for git
zplug "sindresorhus/pretty-time-zsh" # convert seconds to human readable format with command # set theme
zplug "plugins/autojump", from:oh-my-zsh # enables autojump if installed
zplug "djui/alias-tips" # show alias for the typed command
zplug "mafredri/zsh-async", from:github, defer:0 # library for running asynchronous tasks in zsh without requiring any external tools
zplug "plugins/git-extras", from:oh-my-zsh # autocompletion for git-extras commands
zplug "plugins/npm", from:oh-my-zsh # autocompletion for npm
zplug "plugins/pod", from:oh-my-zsh # autocompletion for cocoapods
zplug "plugins/mvn", from:oh-my-zsh # autocompletion for maven
zplug "plugins/docker", from:oh-my-zsh # autocompletion for docker
zplug "plugins/docker-compose", from:oh-my-zsh # autocompletion for docker-compose
zplug "plugins/docker-machine", from:oh-my-zsh # autocompletion for docker-machine
zplug "plugins/kubectl", from:oh-my-zsh # autocompletion for kubernetes
zplug "plugins/adb", from:oh-my-zsh # autocompletion for adb
zplug "plugins/iterm2", from:oh-my-zsh
zplug "pluging/man", from:oh-my-zsh
zplug "plugins/mosh", from:oh-my-zsh # autocompoletion for mosh
zplug "plugins/exract", from:oh-my-zsh # 'extract' commmand convenient for extracting archives of various types
zplug "plugins/cargo", from:oh-my-zsh # autocompletion for cargo (rust package manager)
zplug "plugins/gem", from:oh-my-zsh # autocompletion for gem (ruby package panager)
zplug "plugins/web-search", from:oh-my-zsh # adds commends to do web search (google, bing, ddg)
zplug "wesbos/Cobalt2-iterm", as:theme

# manage zplug itself as a plugins
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

# fix for zplug and zsh-history-substring-search issue that breaks substring history search
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
	bindkey '\eOA' history-substring-search-up
	bindkey '\eOB' history-substring-search-down
elif [[ "$unamestr" == 'Darwin' ]]; then
	bindkey '[A' history-substring-search-up
	bindkey '[B' history-substring-search-down
fi

# sorce my shell scripts
shell_setup=~/.shell-setup.sh
if [ -e $shell_setup ]; then
  source $shell_setup
fi

export NVM_DIR="/home/dudel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
