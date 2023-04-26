# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="typewritten"
TYPEWRITTEN_CURSOR="terminal"

# Which plugins would you like to load?
plugins=(tmux git kubectl pyenv poetry)

source $ZSH/oh-my-zsh.sh

# Brew setup
. /opt/homebrew/etc/profile.d/z.sh

# PATH fixing
export PATH="/opt/homebrew/opt/node@14/bin:$PATH"
export PATH="$PATH:/Users/klaseskilson/.local/bin"

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
alias loadavg="uptime | awk '{split(substr($0, index($0, \"load\")), a, \":\"); print a[2]}'"

# Git aliases
gri() {
  git rebase -i HEAD~$1
}

# Tab completion
autoload -U bashcompinit; bashcompinit
eval "$(register-python-argcomplete pipx)"
eval "$(_BILLODEV_COMPLETE=source_zsh billodev)"
eval "$(_BD_COMPLETE=source_zsh bd)"
