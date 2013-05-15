# .bashrc
# This file is read every time you start an interactive shell

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#####################################
# User specific aliases and functions


##------------------------------------------------------------------------
## ISO 6429 character sequences for colors etc
## lc = leading character sequence, common for all colors.
#lc='\[\e[1;'
## foregrounds----backgrounds--------------------------------------------------
#BLACK=${lc}30m;  B_BLACK=${lc}40m
#RED=${lc}31m;    B_RED=${lc}41m
#GREEN=${lc}32m;  B_GREEN=${lc}42m
#YELLOW=${lc}33m; B_YELLOW=${lc}43m
#BLUE=${lc}34m;   B_BLUE=${lc}44m
#PURPLE=${lc}35m; B_PURPLE=${lc}45m
#CYAN=${lc}36m;   B_CYAN=${lc}46m
#WHITE=${lc}37m;  B_WHITE=${lc}47m
##------------------------------------------------------------------
#BRIGHT=${lc}1m
#UNDER=${lc}4m
#FLASH=${lc}5m
#RC=${lc}0m  # reset character
#SEP="\\\$"  # separator
##------------------------------------------------------------------------

## Reset
#Color_Off='\e[0m'       # Text Reset
#
## Regular Colors
#Black='\e[0;30m'        # Black
#Red='\e[0;31m'          # Red
#Green='\e[0;32m'        # Green
#Yellow='\e[0;33m'       # Yellow
#Blue='\e[0;34m'         # Blue
#Purple='\e[0;35m'       # Purple
#Cyan='\e[0;36m'         # Cyan
#White='\e[0;37m'        # White
#
## Bold
#BBlack='\e[1;30m'       # Black
#BRed='\e[1;31m'         # Red
#BGreen='\e[1;32m'       # Green
#BYellow='\e[1;33m'      # Yellow
#BBlue='\e[1;34m'        # Blue
#BPurple='\e[1;35m'      # Purple
#BCyan='\e[1;36m'        # Cyan
#BWhite='\e[1;37m'       # White
#
## Underline
#UBlack='\e[4;30m'       # Black
#URed='\e[4;31m'         # Red
#UGreen='\e[4;32m'       # Green
#UYellow='\e[4;33m'      # Yellow
#UBlue='\e[4;34m'        # Blue
#UPurple='\e[4;35m'      # Purple
#UCyan='\e[4;36m'        # Cyan
#UWhite='\e[4;37m'       # White
#
## Background
#On_Black='\e[40m'       # Black
#On_Red='\e[41m'         # Red
#On_Green='\e[42m'       # Green
#On_Yellow='\e[43m'      # Yellow
#On_Blue='\e[44m'        # Blue
#On_Purple='\e[45m'      # Purple
#On_Cyan='\e[46m'        # Cyan
#On_White='\e[47m'       # White
#
## High Intensity
#IBlack='\e[0;90m'       # Black
#IRed='\e[0;91m'         # Red
#IGreen='\e[0;92m'       # Green
#IYellow='\e[0;93m'      # Yellow
#IBlue='\e[0;94m'        # Blue
#IPurple='\e[0;95m'      # Purple
#ICyan='\e[0;96m'        # Cyan
#IWhite='\e[0;97m'       # White
#
## Bold High Intensity
#BIBlack='\e[1;90m'      # Black
#BIRed='\e[1;91m'        # Red
#BIGreen='\e[1;92m'      # Green
#BIYellow='\e[1;93m'     # Yellow
#BIBlue='\e[1;94m'       # Blue
#BIPurple='\e[1;95m'     # Purple
#BICyan='\e[1;96m'       # Cyan
#BIWhite='\e[1;97m'      # White
#
## High Intensity backgrounds
#On_IBlack='\e[0;100m'   # Black
#On_IRed='\e[0;101m'     # Red
#On_IGreen='\e[0;102m'   # Green
#On_IYellow='\e[0;103m'  # Yellow
#On_IBlue='\e[0;104m'    # Blue
#On_IPurple='\e[10;95m'  # Purple
#On_ICyan='\e[0;106m'    # Cyan
#On_IWhite='\e[0;107m'   # White


#
# Bash Options
#
#set -o vi
umask 002


#
# Environment
#
PS1="[\u@\h \W]\$ ";

export LESS='-R'

export MYSVN="file:///tsefx/home/dcott/cabinet/svn-rep";
export EDITOR="vim";

R=`cat /etc/redhat-release`;
if [ "$R" == "CentOS release 6.2 (Final)" ]; then
	export LS_COLORS="rs=0:di=00;34:ln=00;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=00;41:sg=00;41:ca=30;41:tw=00:ow=00:st=00:ex=00;32:";
fi


#
# Aliases
#
alias djv="djv_view";
alias write4g="time dd if=/dev/zero of=4gig.tst bs=4k count=1024k";
alias rdesktop="rdesktop -g 1024x768";
alias la="ls -a"
alias ll="ls -l"
alias lal="ls -al"

# Django Aliases
alias rs="./manage.py runserver"

# Rush Tools
function rushSetRamForPausedJobs () {
	for JOBID in `rush -laj | tail -n +3 | grep -v '^\*\*\*' | grep dcott | grep Pause | awk '{print $2}'`; do
		rush -ram $1 $JOBID;
	done;
}

# Navigation Aliases
function ,p () {
	cd ~/cabinet/projects;
}

function ,g () {
	cd ~/cabinet/devel/gitrepo;
}

function ,s () {
	cd ~/cabinet/devel/spikes;
}

function ,a () {
	cd /tsanim/anim/projects;
}

function ,c () {
	cd /tscomp/comp/projects;
}

function ,u () {
	cd /tsportscssu/tsportscssu/projects;
}

# Check the current directory for bin and lib dirs.
# If they exist and aren't already in PATH and PYTHONPATH
# Then prepend them to the env
function ,v () {
	if [ -d "./bin" ]; then
		echo "$PATH" | grep "$PWD/bin" >> /dev/null 2>&1;
		if [ "$?" != "0" ]; then
			export PATH="$PWD/bin:$PATH";
		fi
	fi

	if [ -d "./lib" ]; then
		echo "$PYTHONPATH" | grep "$PWD/lib" >> /dev/null 2>&1;
		if [ "$?" != "0" ]; then
			export PYTHONPATH="$PWD/lib:$PYTHONPATH";
		fi
	fi
}

function ,fsls () {
	find ./ -type f | grep -o -E '^[./a-zA-Z0-9_]+\.[0-9]+\.[a-zA-Z]+' | sed -r 's/\.[0-9]+\./\.*\./' | sort | uniq;
}

function ,fszip () {
	zip $(echo "$1" | sed 's/\.\*\.[a-z]*/.zip/') "$1"; done
}

function ,fstar () {
	tar -czvf $(echo "$1" | sed 's/\.\*\.[a-z]*/.tgz/') "$1"; done
}

function shZipSeq () {
	find ./ -type f | grep -o -E '^[./a-zA-Z0-9_]+\.[0-9]+\.[a-zA-Z]+' | sed -r 's/\.[0-9]+\./\.*\./' | sort | uniq | while read SEQ; do echo "Operating on: ${SEQ#*/}"; zip $(echo "$SEQ" | sed 's/\.\*\.[a-z]*/.zip/') $SEQ; done
}
