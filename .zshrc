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
plugins=(macos tmux git kubectl keychain gpg-agent fzf-tab)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Keychain configuration
zstyle :omz:plugins:keychain agents ssh,gpg
zstyle :omz:plugins:keychain identities id_rsa 18B6DC2EBA84C6CD

# fzf-tab configuration (tmux + suggested)
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup # Enable tmux popup
# disable sort when completing `git checkout`
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'


# Useful exports
export BREW_PREFIX="$(brew --prefix)"

# PATH fixing
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$DOTFILES/scripts"
export PATH="$PATH:$BREW_PREFIX/opt/libpq/bin"

export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH
export XDG_CONFIG_HOME="$HOME/.config"

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

# Git aliases
gri() {
  git rebase -i HEAD~$1
}
alias gdc="git diff --cached"
zz() {
  z $1
  tmux rename-window $1
}
s() { source "$DOTFILES/scripts/switch-context" "$@"; }

# Bring in tools
eval "$($BREW_PREFIX/bin/mise activate zsh)"
eval "$(zoxide init zsh)"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/klas/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

_s_complete() {
  local -a branches tools
  case $CURRENT in
    2)
      branches=(${(f)"$(git branch --format='%(refname:short)' 2>/dev/null)"})
      _describe 'branch' branches
      ;;
    3)
      tools=('c:claude' 'o:opencode' 'claude' 'opencode')
      _describe 'tool' tools
      ;;
  esac
}
compdef _s_complete s

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
