#!/bin/sh
# sorce my shell scripts
shell_setup=~/.shell-setup.sh
if [ -e $shell_setup ]; then
  source $shell_setup
fi
zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/dathlo/.sdkman"
[[ -s "/home/dathlo/.sdkman/bin/sdkman-init.sh" ]] && source "/home/dathlo/.sdkman/bin/sdkman-init.sh"
