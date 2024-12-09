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

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/damirathlo/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
