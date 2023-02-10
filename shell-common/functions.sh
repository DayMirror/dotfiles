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
	kubectl exec --stdin --tty "$pod" -- /bin/bash
}
