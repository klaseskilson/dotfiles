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
brew install zsh
brew install yarn
brew install neovim
brew install rbenv
brew install pyenv
brew install tree
brew install tmux
brew install z
brew install the_silver_searcher
brew install ctags
brew install elixir
brew install reattach-to-user-namespace

brew tap caskroom/cask
brew install brew-cask

brew cask install 1password
brew cask install google-chrome
brew cask install firefox
brew cask install apptivate
brew cask install slack
brew cask install spotify
brew cask install sublime-text
brew cask install the-unarchiver
brew cask install telegram
brew cask install bartender
brew cask install sequel-pro
brew cask install postgres

brew tap homebrew/versions
brew tap homebrew/services
brew tap homebrew/cask-fonts

# Remove outdated versions from the cellar
brew cleanup
