# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

export DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(osx poetry)

source $ZSH/oh-my-zsh.sh
source ~/Developer/dotfiles/paths.sh
source ~/Developer/dotfiles/exports.sh
source ~/Developer/dotfiles/aliases.sh
source ~/Developer/dotfiles/functions.sh

# set username to surpress terminal naming output
export DEFAULT_USER=klaseskilson

# disable aws output
prompt_aws(){}

# make sure "cd ..<TAB>" works as expected
zstyle ':completion:*' special-dirs true

# ------------------------------------------------------------------------------ 
# start things
# start z.sh
. $(brew --prefix)/etc/profile.d/z.sh

# start rbenv
eval "$(rbenv init -)"

# start pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# start nvm
source ~/Development/dotfiles/nvm.sh

# start fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# add Billogram's victoria autocomplete
eval "$(_VICTORIA_COMPLETE=source_zsh victoria)"
eval "$(_V_COMPLETE=source_zsh v)"

export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Created by `userpath` on 2020-11-09 12:18:21
export PATH="$PATH:/Users/klaseskilson/.local/bin"

export PATH="$HOME/.poetry/bin:$PATH"
