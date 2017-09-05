#!/usr/bin/env bash

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Bundle and cask
brew tap Homebrew/bundle

# Install tools and apps
brew bundle Brewfile

# initialize rbenv
rbenv init

# Install oh-my-zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Apply modified osx defaults
source .osx

# Remove all applicaitons from dock
dockutil --no-restart --remove all
killall Dock

# Create symlinks for dotfiles
ln -s ~/dev/dotfiles/.zshrc ~/.zshrc
ln -s ~/dev/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dev/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dev/dotfiles/sublime/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings
ln -s ~/dev/dotfiles/sublime/Default\ \(OSX\).sublime-keymap ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Default\ \(OSX\).sublime-keymap
ln -s ~/dev/dotfiles/sublime/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

