source ~/.bashrc
source ~/.bash_colors
source ~/.git-prompt.sh
source ~/.git-completion.bash

parse_git_status() {
if [ ! -d "$PWD/.git" ]
then
    exit
else
	git status | grep "nothing to commit" > /dev/null 2>&1
	if [ "$?" -eq "0" ] 
	then 
		git status | grep "Your branch is ahead of" > /dev/null 2>&1
		if [ "$?" -eq "0" ] 
		then 
			echo $BIGreen;
		else 
			echo $BICyan;
		fi
	else 
		echo $BIRed;
	fi
fi
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=
GIT_PS1_SHOWUPSTREAM="auto git verbose"
GIT_PS1_DESCRIBE_STYLE="branch"
PROMPT_COMMAND='__git_ps1 "$IWhite[$ICyan\h$IWhite:$IYellow\w$IWhite]$(parse_git_status)" " $Color_Off\\\\$ "'

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh;

