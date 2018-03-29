[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

set -o vi

eval "$(rbenv init -)"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/usr/local/sbin:$PATH"

# Hard change over
alias emacs=vim
# Useful for editing + getting changes - only works in single tab
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
# Getting ctags to work on OSX
alias ctags="`brew --prefix`/bin/ctags"
# Useful way to view SAML in terminal
alias decode="base64 -D | xmllint --format -"
# Alias for Github CLI (delegates to normal git where relevant)
alias git=hub
# Classic typo
alias gti=git
alias gst="git status"
alias "ga."="git add ."
alias gitk=/usr/local/bin/git/bin/gitk
# Recursive search of directory whilst ignoring typically noisy search paths
alias gr="grep -Ri --color=always --exclude-dir .git --exclude-dir .idea"
alias dc=docker-compose

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Open VSCode from terminal. Only really works if VSCode is shut beforehand
code () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

# Bash prompt
# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
	then
	STAT=`parse_git_dirty`
	echo "[${BRANCH}${STAT}]"
else
echo ""
fi
}

# Nice git status prompt
# get current status of git repo
function parse_git_dirty {
status=`git status 2>&1 | tee`
dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
bits=''
if [ "${renamed}" == "0" ]; then
    bits=">${bits}"
    fi
if [ "${ahead}" == "0" ]; then
    bits="*${bits}"
    fi
if [ "${newfile}" == "0" ]; then
    bits="+${bits}"
fi
if [ "${untracked}" == "0" ]; then
    bits="?${bits}"
fi
if [ "${deleted}" == "0" ]; then
    bits="x${bits}"
fi
if [ "${dirty}" == "0" ]; then
    bits="!${bits}"
fi
if [ ! "${bits}" == "" ]; then
    echo " ${bits}"
else
echo ""
fi
}

# Pretty colours
export PS1="\[\e[31m\][\[\e[m\]\[\e[31m\]\A\[\e[m\]\[\e[31m\]]\[\e[m\]\[\e[36m\]\u\[\e[m\]@\[\e[33m\]\w\[\e[m\]:\[\e[35m\]\`parse_git_branch\`\[\e[m\]=> "

export PATH
