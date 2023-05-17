# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/Developer/klaseskilson/dotfiles"

ZSH_THEME="typewritten"
TYPEWRITTEN_CURSOR="terminal"

# Which plugins would you like to load?
plugins=(macos tmux git kubectl pyenv poetry)

source $ZSH/oh-my-zsh.sh

# Brew setup
. /opt/homebrew/etc/profile.d/z.sh

# PATH fixing
export PATH="/opt/homebrew/opt/node@16/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$DOTFILES/scripts"

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
eval "$(register-python-argcomplete pipx)"
eval "$(_BILLODEV_COMPLETE=source_zsh billodev)"
eval "$(_BD_COMPLETE=source_zsh bd)"
