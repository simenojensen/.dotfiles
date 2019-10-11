# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs'
else
  export EDITOR='emacs'
fi

# coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# zsh-autocompletion
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-history-substring-search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# z rupa
. /usr/local/etc/profile.d/z.sh

# openVPN
export PATH="/usr/local/opt/openvpn/sbin:$PATH"

# gnu-sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

