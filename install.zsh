#!/usr/bin/env zsh
export PATH="$HOME/.local/bin:$PATH"

echo "Creating directories"
mkdir -p $HOME/.local/{bin,share,etc}

echo "Install piu"
curl -s https://raw.githubusercontent.com/keithieopia/piu/master/piu -o ~/.local/bin/piu
chmod +x ~/.local/bin/piu

echo "Install required packages"
export DEBIAN_FRONTEND=noninteractive
piu i -y zsh neovim gawk subversion

echo "Installing Ellipsis"
export ELLIPSIS_PATH=$HOME/.local/share/ellipsis
git clone https://github.com/ellipsis/ellipsis.git $HOME/.local/share/ellipsis
ln -s $ELLIPSIS_PATH/bin/ellipsis $HOME/.local/bin/

echo "Installing dotfiles"
ellipsis install lugoues/zsh
ellipsis install lugoues/nvim

