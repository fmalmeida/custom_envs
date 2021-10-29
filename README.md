<p align="center">

  <h1 align="center">custom_envs</h1>

  <p align="center">
    <h3 align="center">Just a repo in which to save some useful and fancy UNIX/Bash functions and environment customisation</h3>
    <br />
    <strong>- Felipe M. Almeida</strong>
    <br />
  </p>
</p>

## Customizing prompt

```bash
# Customizing PROMPT
SIMPLEPROMPT='\w> '
FANCYPROMP='\[\e[1;31;40m\]┏━┅◉ \[\e[4;34m\]\w\[\e[0;40m\] ┅┅◈ \d ⌚ \A \[\e[1;38m\]┅┅◈ \u@\H (\!)\[\e[0m\]\n\[\e[1;31m\]┗━►\[\e[0m\] '
PS1="$FANCYPROMP"

#this will change the title to your full current working directory
PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'
# End of: Prompt customization }}} #
```

## Useful functions

### Query/check the latest release tag of a Git repo.

This function enables that you easily check which is the latest release tag available in a github repository. Usage: `get_latest_release {username/repository}`.

```bash
get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}
```

### Force release update in Github.

This function enables that you easily update a published Github release to "watch" or to use/save files from the latest commit. Usage: `force_git_release_update_to_commit {relase tag}`.

```bash
force_git_release_update_to_commit() {
    #do things with parameters like $1 such as
    git tag -f -m "Forcing minor update of docs" -a $1
    git push
    git push -f --tags
}
```

### Download files from onedrive

This function enables that you easily download files stored in onedrive in the command line using the "sharing" url link. Usage: `onelink 'https://1drv.ms/t/s!ApRqRchcfy5ngoUeuYHA65us-fYO-Q?e=LbC7AJ' {output file name}`.

```bash
onelink() {

  if [ ! -n "$2" ]; then
    name='outputfile'
  else
    name="$2"
  fi

  link=$(echo -n "$1"|base64|sed "s/=$//;s/\//\_/g;s/\+/\-/g;s/^/https:\/\/api\.onedrive\.com\/v1\.0\/shares\/u\!/;s/$/\/root\/content/" | head -n 1);
  link=\'${link}\'
  bash -c "wget -O ${name} ${link}" ;

}
```

### Check disk usage/mounted

```bash
checkdisk() { ps aux | grep fsck; }
```

### SSH config

How to config a ssh config, with jumps? So you can connect to servers, using another as "entrance" without using passwords? Super handy to use with VS Code.

```bash
Host main
	HostName 192.168.33.10      # can be the ip (192.168.33.10) or the address (example.com) or machine name (machine)
	User user                   # the user name to login
	Port 3457                   # port for connection
	IdentityFile ~/.ssh/id_rsa  # path to the public key created with ssh-keygen

# to access this one we must be in "main"
Host secondary
	HostName second
  User user
  Port 22
	IdentityFile ~/.ssh/id_rsa_second    # this key must be from your local machine to the second server, not from the "main" to the "second"
	ProxyJump main                       # this is the key -- it tells ssh to access this machine using the "main" as entrance
	ServerAliveInterval 240              # configuration of time for server to survive
	ServerAliveCountMax 2                # max number of alive servers
```

* Keys must be created with `ssh-keygen`
  + Can be manually placed inside ~/.ssh/authorized_keys inside the "server" machine
  + Or can be added to the "server" machine with `ssh-copy-id`