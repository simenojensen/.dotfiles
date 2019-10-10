# Manage dotfiles with git bare repository
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# Listing
alias la='ls -aFlh --almost-all --group-directories-first --color=auto'

# emacs
#alias emacs="emacs -nw"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
