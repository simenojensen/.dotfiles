# Manage dotfiles with git bare repository
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# Colorls
alias la="colorls --almost-all --long --group-directories-first"

# update
alias update="sudo softwareupdate -ia; brew update; brew cask upgrade; brew cleanup; conda deactivate; conda update conda --yes; conda update --all --yes; conda activate py3; conda update --all --yes; conda clean --all --yes; brew bundle dump --global --force"

# emacs
alias emacs="emacs -nw"

