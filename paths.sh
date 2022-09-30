# Add path modifications here
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# local scripts
PATH="/Users/klaseskilson/Developer/dotfiles/scripts:$PATH"

# rust(up)
PATH="/Users/kalas/.cargo/bin:$PATH"

# Go
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
