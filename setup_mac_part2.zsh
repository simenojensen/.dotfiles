#!/usr/bin/env zsh

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Remove oh_my_zsh .zshrc
cd $HOME
rm .zshrc

# Setup github dotfiles structure:
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
git clone --bare https://www.github.com/simenojensen/.dotfiles.git $HOME/.dotfiles.git
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
dotfiles pull

# Download homebrew packages
brew bundle --global --force

# conda
conda create -n py3
conda config --append channels conda-forge
conda config --append channels anaconda
conda config --append channels spyder-ide
conda install spyder --yes

