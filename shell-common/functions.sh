sshagent()
{
	eval `ssh-agent -s`
	ssh-add
}

dir()
{
	mkdir "$1"
	cd "$1"
}

gitpushall()
{
	git add -A && git commit -m $1 && git push origin HEAD
}

getabspath()
{
	echo "$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
}

renamextension()
{
	local source_extension="$1"
	local target_extension="$2"
	local dir="$3"
	if [ -z $source_extension ] || [ -z $target_extension ] || [ -z $dir ]; then
		echo "Invalid command invokation\nUsage: 'renameextension original_extension new_extension directory'"
		return 1
	fi
	find "$dir" -depth -type f -name "*.$source_extension" -exec echo 'Renaming ' {} \; -execdir rename "s/\.$source_extension$/\.$target_extension/" {} \;
}

freeport()
{
	local port="$1"
	local pid=`lsof -i :$port | grep LISTEN | awk '{ print $2 }'`
	if [ -n "$pid" ]; then
		echo "Killing process with PID=$pid"
		kill $pid
	else
		echo "Port $port is free"
	fi
}

redisinsight()
{
	export POD_NAME=$(kubectl get pods --namespace infrastructure -l "app=redisinsight" -o jsonpath="{.items[0].metadata.name}")
	echo "Visit http://127.0.0.1:8001 to use your application"
	kubectl --namespace infrastructure port-forward $POD_NAME 8001:8001
}

knodeshell()
{
	local node="$1"
	if [ -z $node ]; then
		echo "Usage kdebug <node_id>"
		return 1
	fi
	kubectl debug node/$1 --image=docker.io/library/alpine:latest -it
}

kpodshell()
{
	local pod="$1"
	if [ -z $pod ]; then
		echo "Usage kshell <pod_name>"
		return 1
	fi
	kubectl exec --stdin --tty "$pod" -- /bin/sh
}

setgitoriginhost() {
	local new_hostname="$1"
	# Check if a new hostname was provided
	if [[ -z "$new_hostname" ]]; then
		echo "Usage: change_git_hostname <new_hostname>"
		return 1
	fi

	# Get the current origin URL
	local current_url
	current_url=$(git remote get-url origin 2>/dev/null)

	if [[ $? -ne 0 || -z "$current_url" ]]; then
		echo "Error: Unable to retrieve current origin URL. Are you in a Git repository?"
		return 1
	fi

	# Parse the URL and replace the hostname
	local new_url
	if [[ "$current_url" =~ ^git@([^:]+): ]]; then
		# SSH URL: git@hostname:path
		new_url=$(echo "$current_url" | sed -E "s|^git@[^:]+:|git@$new_hostname:|")
	elif [[ "$current_url" =~ ^https?://([^/]+)/ ]]; then
		# HTTPS URL: https://hostname/path
		new_url=$(echo "$current_url" | sed -E "s|^(https?://)[^/]+/|\1$new_hostname/|")
	else
		echo "Error: Unsupported URL format: $current_url"
		return 1
	fi

	# Update the origin URL
	git remote set-url origin "$new_url"
	if [[ $? -eq 0 ]]; then
		echo "Successfully changed origin hostname to: $new_hostname"
		echo "New origin URL: $new_url"
	else
		echo "Error: Failed to update origin URL."
		return 1
	fi
}

setgiturlscheme() {
	local format="$1"
	if [[ -z "$format" || ( "$format" != "git" && "$format" != "https" ) ]]; then
		echo "Usage: change_git_url_format <git|https>"
		return 1
	fi

	# Get the current origin URL
	local current_url
	current_url=$(git remote get-url origin 2>/dev/null)
	if [[ $? -ne 0 || -z "$current_url" ]]; then
		echo "Error: Unable to retrieve current origin URL. Are you in a Git repository?"
		return 1
	fi
	echo "current_url is $current_url"
	
	local new_url
	if [[ "$format" == "git" ]]; then
		# Convert to SSH format if the current URL is HTTPS
		if [[ "$current_url" =~ ^https?://([^/]+)/(.+)$ ]]; then
			local hostname="${match[1]}"
			local repo_path="${match[2]}"
			new_url="git@$hostname:$repo_path"
			else
				echo "The origin URL is already in git@ format or unsupported: $current_url"
				return 0
			fi
		elif [[ "$format" == "https" ]]; then
			# Convert to HTTPS format if the current URL is SSH
			if [[ "$current_url" =~ ^git@([^:]+):(.+)$ ]]; then
				local hostname="${match[1]}"
				local repo_path="${match[2]}"
				new_url="https://$hostname/$repo_path"
			else
				echo "The origin URL is already in HTTPS format or unsupported: $current_url"
				return 0
			fi
		fi
	# Update the origin URL
	git remote set-url origin "$new_url"
	if [[ $? -eq 0 ]]; then
		echo "Successfully changed origin URL to $format format."
		echo "New origin URL: $new_url"
	else
		echo "Error: Failed to update origin URL."
		return 1
	fi
}
