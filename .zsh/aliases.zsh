# Manage dotfiles with git bare repository
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
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
# emacs-libvterm
# if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    # alias clear='vterm_printf "51;Evterm-clear-scrollback";tput clear'
# fi
alias cl="clear"
alias ccl="cd; clear"

# Listing
alias la='ls -aFlh --almost-all --group-directories-first --color=auto'

# cat
alias cat="ccat --bg=dark"

# emacs
# alias emacs="emacs -nw"

# Reload the shell (i.e. invoke as a login shell)
alias reload="source ~/.zshrc"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Lock the screen (when going AFK)
alias afk="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'"

# stop ping after 10 sends
#alias ping='ping -c 10'

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Work
alias routing_table="conda activate ping; cd ~/Desktop/raalabs/scripts/; ./routing_table.py; conda activate py3"
