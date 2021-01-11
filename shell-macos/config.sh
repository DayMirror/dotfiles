test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

VS_CODE_DEFAULT_SETTINGS_PATH="$HOME/Library/Application Support/Code/User/settings.json"
VS_CODE_CUSTOM_SETTINGS_PATH="$HOME/.vscode.settings"
if [ -e $VS_CODE_CUSTOM_SETTINGS_PATH ]; then
  if [ -f $VS_CODE_DEFAULT_SETTINGS_PATH ]; then
    rm $VS_CODE_DEFAULT_SETTINGS_PATH
  fi
  ln -s $VS_CODE_CUSTOM_SETTINGS_PATH $VS_CODE_DEFAULT_SETTINGS_PATH
fi

gcloud_completions_file="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
if [ -f $gcloud_completions_file ]; then
	source $gcloud_completions_file
fi
gcloud_path_file="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
if [ -f $gcloud_path_file ]; then
	source $gcloud_path_file
fi
