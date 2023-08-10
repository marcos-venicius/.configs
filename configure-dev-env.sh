#!/bin/bash

help() {
  echo "usage: ./configure-dev-env.sh <GITHUB-EMAIL> <GITHUB-USERNAME>"
}

if [ -z "$1" ] || [ -z "$2" ]; then
  help
  exit 1
fi

GIT_EMAIL="$1"
GIT_USERNAME="$2"

# Install git

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git -y

# Configure git

git config --global user.name $GIT_USERNAME
git config --global user.email $GIT_EMAIL

git config --global core.editor vim

git config --global alias.co "checkout"
git config --global alias.lg "log --graph --pretty=fuller --stat --notes --dirstat --abbrev-commit --decorate --all"
git config --global alias.c "commit"
git config --global alias.ac "!git add -A && git commit"
git config --global alias.st "status -sb"
git config --global alias.stl "status -sb ."
git config --global alias.tags "tag -l"
git config --global alias.p "push"
git config --global alias.branches "branch -a"
git config --global alias.remotes "remote -v"
git config --global alias.untrack "update-index --assume-unchanged"
git config --global alias.track "update-index --no-assume-unchanged"

git config --global init.defaultBranch main

# Install neovim

mkdir /tmp/install-neovim
cd /tmp/install-neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
sudo mv squashfs-root /opt/nvim
sudo ln -s /opt/nvim/AppRun /usr/bin/nvim
cd ~
rm -rf /tmp/install-neovim

# Install vim plug

echo "INSTALLING VIM PLUG"

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "VIM PLUG INSTALLED"

# Add nvim configurations

echo "CONFIGURING NVIM"

cd /tmp

wget https://raw.githubusercontent.com/marcos-venicius/.configs/main/files/nvim/init.vim

mkdir -p ~/.config/nvim

mv init.vim ~/.config/nvim/init.vim

echo "NVIM CONFIGURED"

# Installing tmux

sudo apt install tmux -y

# Configuring tmux

echo "CONFIGURING TMUX"

wget https://raw.githubusercontent.com/marcos-venicius/.configs/main/files/tmux/.tmux.conf

mv .tmux.conf ~

echo "TMUX CONFIGURED"

echo "CONFIGURING COMMAND SHRINK"

cd ~ && echo "export SHRINK_TERMINAL=bash" >> ~/.bashrc && mkdir .shrink && cd .shrink && git clone https://github.com/marcos-venicius/command-shrink.git shrink && echo 'shrink() { ~/.shrink/shrink/cli.py "$@"; exec bash; }' >> ~/.bashrc && cd ~ && SHRINK_TERMINAL=bash shrink -help

# My default shrink configurations
# To see more access: https://github.com/marcos-venicius/command-shrink

~/.shrink/shrink/cli.py st @ "git st"
~/.shrink/shrink/cli.py cm @ "git commit -m"
~/.shrink/shrink/cli.py all @ "git add -A"
~/.shrink/shrink/cli.py psh @ "git push"
~/.shrink/shrink/cli.py update @ "git fetch && git fetch --prune && git pull"
~/.shrink/shrink/cli.py clone @ "git clone"
~/.shrink/shrink/cli.py tl @ "tmux list-sessions"

echo "COMMAND SHRINK CONFIGURED"

clear

echo Done!


echo "Please open nvim and run :PlugInstall"

cd ~

