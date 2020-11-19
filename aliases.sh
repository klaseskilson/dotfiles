# Git aliases
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gcf="git diff --name-only develop"
alias gco="git checkout"
alias gd="git diff"
alias gdc="git diff --cached"
alias gf="git fetch"
alias gp="git push"
alias gre="git rebase"
alias gst="git status"
alias gr="git rebase"

gri() {
  git rebase -i HEAD~$1
}

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

# close tmux panes with blazing speed
alias e="exit"

alias pbunserialize='pbpaste | php -r "echo json_encode(unserialize(stream_get_contents(STDIN)));" | jq'
