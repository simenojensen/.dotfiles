#!/bin/sh
#
# This script does the following:
# - Sets up https://github.com/simenojensen/.dotfiles as bare repository
# - Downloads Homebrew
# - Installs brew packages with brew bundle
# - Installs brew cask applications with brew bundle
# - Initializes conda
# - Downloads Oh-My-ZSH
# - Sets up /usr/local/bin/zsh as default shell

# Define sudo keepalive function
start_sudo() {
    sudo -v
    ( while true; do sudo -v; sleep 60; done; ) &
    SUDO_PID="$!"
    trap stop_sudo SIGINT SIGTERM
}

# Define stop sudo keep alive function
stop_sudo() {
    kill "$SUDO_PID"
    trap - SIGINT SIGTERM
    sudo -k
}

echo "Starting Bootstrap..."

###
start_sudo
###

# Setup dotfiles bare repository
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
git clone --bare https://www.github.com/simenojensen/.dotfiles.git $HOME/.dotfiles.git
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle --global --verbose

# Setup conda
conda create -n py3 --yes
conda config --append channels conda-forge
conda config --append channels anaconda
conda config --append channels spyder-ide
conda activate py3
conda install spyder --yes


# Clone oh my zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# Set homebrew zsh as default shell
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

###
stop_sudo
###
