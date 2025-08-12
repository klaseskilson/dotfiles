# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/Developer/klaseskilson/dotfiles"

# Prompt style and configuration
ZSH_THEME="typewritten"
TYPEWRITTEN_CURSOR="terminal"
TYPEWRITTEN_RELATIVE_PATH="adaptive"
TYPEWRITTEN_COLORS="right_prompt_prefix:blue"
TYPEWRITTEN_ARROW_SYMBOL="➜"
display_kube_context() {
  local tw_kube_context="$(kubectl config current-context 2> /dev/null)"
  local tw_kube_namespace="$(kubectl config view --minify -o jsonpath='{..namespace}' 2> /dev/null)"

  if [[ $tw_kube_context != "" ]]; then
    echo -n "\u2388 "
    echo -n "$(basename $tw_kube_context)"
    if [[ $tw_kube_namespace != "" ]]; then
      echo -n ":$tw_kube_namespace"
    fi
  fi
}
# TYPEWRITTEN_RIGHT_PROMPT_PREFIX_FUNCTION=display_kube_context

# OH-MY-ZSH plugins
plugins=(macos tmux git kubectl keychain gpg-agent)

zstyle :omz:plugins:keychain agents ssh,gpg
zstyle :omz:plugins:keychain identities id_rsa 18B6DC2EBA84C6CD

source $ZSH/oh-my-zsh.sh

export BREW_PREFIX="$(brew --prefix)"

# PATH fixing
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$DOTFILES/scripts"
export PATH="$PATH:$BREW_PREFIX/opt/libpq/bin"

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"

# bring in NVM
# export NVM_DIR="$HOME/.nvm"
#   [ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$BREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Misc exports
export GPG_TTY=$(tty)
export EDITOR=nvim
export AWS_REGION=eu-west-1
export LC_ALL=en_US.UTF-8

# Aliases
alias vi=nvim
alias rm="rm -I"
alias pbunserialize='pbpaste | php -r "echo json_encode(unserialize(stream_get_contents(STDIN)));" | jq'
alias e="exit"
alias f='open -a Finder ./'
alias ghpr='gh pr view --json url | jq ".url" | tr -d "\""'
alias ghprcp='ghpr | pbcopy'
alias ghpro='open $(ghpr)'

# Tunnelblick aliases
tbdc() {
  osascript -e 'tell application "Tunnelblick" to disconnect all'
}
tbc() {
  osascript -e 'tell application "Tunnelblick" to connect (get name of configuration 2)'
}

# Git aliases
gri() {
  git rebase -i HEAD~$1
}
alias gdc="git diff --cached"
zz() {
  z $1
  tmux rename-window $1
}

# Tab completion
autoload -U bashcompinit; bashcompinit

eval "$($BREW_PREFIX/bin/mise activate zsh)"
eval "$(zoxide init zsh)"
