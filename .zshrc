# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

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
# plugins=(git git-flow zsh-completions autoenv aws battery bower brew docker docker-compose gem lein nmap node npm osx pip sublime supervisor tmux vagrant virtualenv )
#plugins=(git zsh-completions autoenv lein node npm osx pip sublime supervisor tmux virtualenv )
source $ZSH/oh-my-zsh.sh
autoload -U compinit && compinit

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}
load() {
  #easton commented
  #info "loading $1"
  source $1
}
# dotfiles
# shortcut to this dotfiles path is $DOTFILES
export DOTFILES=$HOME/.extra
if [ -d "$DOTFILES" ];
then
  # all of our zsh files
  typeset -U config_files
  config_files=($DOTFILES/**/*.zsh)
  # load the path files
  # 获取到所有目录下path.zsh的文件, 优先载入
  for file in ${(M)config_files:#*/path.zsh}
  do
    load $file
  done
if
if [ -d "$DOTFILES" ];
  # all of our zsh files
  typeset -U config_files
  config_files=($DOTFILES/**/*.zsh)
  # load everything but the path and completion files
  # 然后载入除掉所有目录下path.zsh的文件
  for file in ${config_files:#*/path.zsh}
  do
    load $file
  done
  # load every completion after autocomplete loads
  for file in ${(M)config_files:#*/completion.zsh}
  do
    source $file
  done
  unset config_files
fi

alias ll='ls -la'
alias la='ls -a'
alias vi='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias . source
# show and hide dotfiles
alias show='defaults write com.apple.finder AppleShowAllFiles YES'
alias hide='defaults write com.apple.finder AppleShowAllFiles NO'

# shortcut for Emacs
alias e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -c --no-wait'
#alias emacs='emacs -q --load /Users/easton/.eastonmacs.el'
alias tsh='trash'

# associate file type with apps
alias -s html=mate   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=mate     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

# simple movie to gif converter
mov2gif () { ffmpeg -i $1 -s 1280x800 -pix_fmt rgb24 -r 24 -f gif - | gifsicle --optimize=3 --delay=3 > $2 }

# set pyenv autocomplete
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# RVM must be initialized after pyenv, rvm path must be the first in PATH
# Load RVM into a shell session *as a function*
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin" 
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

# make agnoster work in all interfaces
export SEGMENT_SEPARATOR=''

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
export NODE_PATH=/Users/easton/.nvm/versions/node/v8.0.0/lib/node_modules/
