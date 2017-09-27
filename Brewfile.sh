# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew install dockutil
brew install git
brew install mysql
brew install node
brew install redis
brew install npm
brew install python
brew install python3
brew install zsh
brew install yarn
brew install neovim
brew install rbenv
brew install tree
brew install autojump

brew tap caskroom/cask
brew install brew-cask

brew cask install 1password
brew cask install appcleaner
brew cask install flux
brew cask install google-chrome
brew cask install iterm2
brew cask install slack
brew cask install spotify
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install keybase
brew cask install oversight
brew cask install steam
brew cask install google-photos-backup-and-sync
brew cask install telegram
brew cask install sequel-pro
brew cask install figma
brew cask install sketch
brew cask install vanilla
brew cask install whatsyoursign
brew cask install vlc
brew cask install postgres

brew tap homebrew/versions

# Remove outdated versions from the cellar
brew cleanup
