#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Bundle and cask
brew tap Homebrew/bundle

# Install tools and apps
./Brewfile.sh
curl https://sh.rustup.rs -sSf | sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# initialize rbenv
rbenv init

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Apply modified osx defaults
source .osx

# Remove all applicaitons from dock
dockutil --no-restart --remove all
killall Dock

mkdir ~/.config/nvim

# Create symlinks for dotfiles
ln -s "$(pwd)/.zshrc" ~/.zshrc
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -s "$(pwd)/.vimrc" ~/.config/nvim/init.vim
ln -s "$(pwd)/.gitconfig" ~/.gitconfig
ln -s "$(pwd)/.gitignore_global" ~/.gitignore_global
ln -s "$(pwd)/sublime/Package\ Control.sublime-settings" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -s "$(pwd)/sublime/Default\ \(OSX\).sublime-keymap" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -s "$(pwd)/sublime/Preferences.sublime-settings" ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s "$(pwd)/.agignore" ~/.agignore
