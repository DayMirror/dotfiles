test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

VS_CODE_DEFAULT_SETTINGS_PATH="$HOME/Library/Application Support/Code/User/settings.json"
VS_CODE_CUSTOM_SETTINGS_PATH="$HOME/.vscode.settings"
if [ -e $VS_CODE_CUSTOM_SETTINGS_PATH ]; then
  if [ -f $VS_CODE_DEFAULT_SETTINGS_PATH ]; then
    rm $VS_CODE_DEFAULT_SETTINGS_PATH
  fi
  ln -s $VS_CODE_CUSTOM_SETTINGS_PATH $VS_CODE_DEFAULT_SETTINGS_PATH
fi