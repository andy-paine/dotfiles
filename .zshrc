bindkey -v

function dkill {
  docker ps -f name="$1" --format "{{ .Names }}" | xargs docker kill
}
function dlogs {
  docker logs ${@:2} $(docker ps -f name="$1" --format "{{ .Names }}")
}

function dbpwd {
  aws kms decrypt --ciphertext-blob \
    fileb://<(cat ~/Projects/verify-event-infrastructure/environments/$1/site.tf | hclq get -r "module.recording_system.event-store-password" | sed "s/\"//g" | base64 -D) \
     --query Plaintext --output text | base64 -D | pbcopy
  echo "$1 DB password copied to clipboard"
}

eval "$(rbenv init -)"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/usr/local/sbin:$PATH"
export COMPOSE_IGNORE_ORPHANS=true
export VISUAL=vim

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"
# Hard change over
alias emacs=vim
# Useful for editing + getting changes - only works in single tab
alias vimrc="vim ~/.vimrc"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
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
alias dc=docker-compose
alias drun="docker run -it --entrypoint sh"
alias dps="docker ps"
alias mkx="chmod +x"
alias jws="cut -f 2 -d . - | base64 -D | jq"
alias cert="openssl x509 -noout -in"
alias tf=terraform
alias tfplan="terraform plan | landscape"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
. /usr/local/etc/profile.d/z.sh

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git, cf
)

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
