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

sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git -y

# CONFIGURE GIT

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

# CONFIGURE NEOVIM

wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mkdir /opt/nvim
mv nvim.appimage /opt/nvim
sudo ln -s /opt/nvim/nvim.appimage /usr/bin/nv
mkdir ~/.config/nvim
wget https://raw.githubusercontent.com/marcos-venicius/.configs/main/files/nvim/init.lua --output-document=$HOME/.config/nvim/init.lua

# CONFIGURE TMUX

sudo apt install tmux -y

wget https://raw.githubusercontent.com/marcos-venicius/.configs/main/files/tmux/.tmux.conf --output-document=$HOME/.tmux.conf

# CONFIGURE ASDF

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
echo '. "$HOME/.asdf/asdf.sh"' >> ~/.bashrc
echo '. "$HOME/.asdf/completions/asdf.bash"' >> ~/.bashrc

# CONFIGURE COMMAND SHRINK

cd ~ && echo "export SHRINK_TERMINAL=bash" >> ~/.bashrc && mkdir .shrink && cd .shrink && git clone https://github.com/marcos-venicius/command-shrink.git sk && echo 'sk() { ~/.shrink/sk/main.py "$@"; exec bash; }' >> ~/.bashrc

~/.shrink/sk/main.py -a st "git st"
~/.shrink/sk/main.py -a cm "git commit -m"
~/.shrink/sk/main.py -a all "git add -A"
~/.shrink/sk/main.py -a psh "git push"
~/.shrink/sk/main.py -a gpull "git fetch && git fetch --prune && git pull"
~/.shrink/sk/main.py -a clone "git clone"
~/.shrink/sk/main.py -a tl "tmux list-sessions"
~/.shrink/sk/main.py -a ta "tmux attach-session -t"
~/.shrink/sk/main.py -a m "mkdir"
~/.shrink/sk/main.py -a lg "git lg"

clear

echo ""
echo "Please, close your terminal and open again"
echo -e "\033[1;37mINSTALLED FEATURES\033[0m"
echo ""
echo -e "\033[1;36m  GIT\033[0m"
echo -e "\033[1;36m  NEOVIM\033[0m"
echo -e "\033[1;36m  TMUX\033[0m"
echo -e "\033[1;36m  ASDF\033[0m"
echo -e "\033[1;36m  COMMAND SHRINK\033[0m"
echo ""
