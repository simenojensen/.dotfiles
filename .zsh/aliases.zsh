# Manage dotfiles with git bare repository
alias dotfiles="git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"
alias dstatus="dotfiles status"
alias dadd="dotfiles add"
alias dcommit="dotfiles commit -m"
alias dpush="dotfiles push origin master"
alias dpull="dotfiles pull origin master"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias cl="clear"

# Listing
alias la='ls -aFlh --almost-all --group-directories-first --color=auto'

# cat
alias cat="ccat --bg=dark"

# emacs
#alias emacs="emacs -nw"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# stop ping after 10 sends
alias ping='ping -c 10'
