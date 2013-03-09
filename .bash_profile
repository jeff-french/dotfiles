source ~/.bash_colors
source /usr/local/git/contrib/completion/git-completion.bash
source /usr/local/etc/bash_completion.d/git-prompt.sh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/usr/local/bin:$PATH:$HOME/android_dev/adt-bundle-mac/sdk/platform-tools:$HOME/android_dev/adt-bundle-mac/sdk/tools

export NODE_PATH=/usr/local/lib/node_modules

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
			echo $BGreen;
		else 
			echo $BCyan;
		fi
	else 
		echo $BRed;
	fi
fi
}

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=
GIT_PS1_SHOWUPSTREAM="auto git verbose"
GIT_PS1_DESCRIBE_STYLE="branch"
PROMPT_COMMAND='__git_ps1 "$BWhite[$BYellow\w$BWhite]$(parse_git_status)" " $Color_Off\\\\$"'
#PROMPT_COMMAND='__git_ps1 "$BWhite[$BYellow\w$BWhite]" " $Color_Off\\\\$"'
