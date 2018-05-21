run-ssh-agent()
{
    eval `ssh-agent -s`
    ssh-add
}