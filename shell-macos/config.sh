test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

gcloud_completions_file="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
if [ -f $gcloud_completions_file ]; then
	source $gcloud_completions_file
fi
gcloud_path_file="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
if [ -f $gcloud_path_file ]; then
	source $gcloud_path_file
fi
