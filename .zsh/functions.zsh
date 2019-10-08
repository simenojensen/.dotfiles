# update macOS, homebrew, conda
function update() {
    sudo softwareupdate -ia
    brew update
    brew upgrade
    brew cask upgrade
    brew cleanup
    conda deactivate
    conda update conda --yes
    conda update --all --yes
    conda activate py3
    conda update --all --yes
    conda clean --all --yes
    brew bundle dump --global --force
}



