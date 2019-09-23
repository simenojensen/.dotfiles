# Manage dotfiles with git bare repository
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# Colorls
alias la="colorls --almost-all --long --group-directories-first"
alias ls="colorls -1 --group-directories-first"

# emacs
alias emacs="emacs -nw"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

