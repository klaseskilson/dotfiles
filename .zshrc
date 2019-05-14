# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# setup ssh keys for this session
ssh-add -A 2>/dev/null

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(osx)

# User configuration

source $ZSH/oh-my-zsh.sh
source ~/Development/dotfiles/paths.sh
source ~/Development/dotfiles/exports.sh

# Git aliases
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gf="git fetch"
alias gst="git status"
alias gp="git push"
alias gre="git rebase"

#   finderShowHidden:   Show hidden files in Finder
#   finderHideHidden:   Hide hidden files in Finder
#   -------------------------------------------------------------------
alias finderShowHidden='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias finderHideHidden='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'

# Other aliases
alias vi="nvim"
alias be="bundle exec"
alias vc="vagrant ssh -c"

# open current pwd in finder using 'f' command
alias f='open -a Finder ./'

# make sure ctags works as expected
alias ctags="$(brew --prefix)/bin/ctags"

# add ECS run alias
alias ecs-run="docker run -i -v ~/.aws:/root/.aws:ro -e AWS_PROFILE -e AWS_DEFAULT_REGION=eu-west-1 edalen/ecs-run"

# docker alias
alias dc="docker-compose"

# rspec
alias rspec_changed_files="bundle exec rspec `git diff --name-only develop | ag spec`"

# make sure "cd ..<TAB>" works as expected
zstyle ':completion:*' special-dirs true

# set username to surpress terminal naming output
export DEFAULT_USER=kalas

# start z
. $(brew --prefix)/etc/profile.d/z.sh

# start rbenv
eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
