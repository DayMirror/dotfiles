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
