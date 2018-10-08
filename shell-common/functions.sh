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
