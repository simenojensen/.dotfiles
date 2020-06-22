# Coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# DocBook
export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

# Emacs Shell
# This allows running `shell` properly within Emacs
if [ -n "$INSIDE_EMACS" ]; then
  export TERM=dumb
else
  export TERM=xterm-256color
fi

# Findutils
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"

# GNU Getopt
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"

# GNU sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

# icu4c
# export PATH="/usr/local/opt/icu4c/bin:$PATH"
# export PATH="/usr/local/opt/icu4c/sbin:$PATH"
# For compilers to find icu4c you may need to set:
# export LDFLAGS="-L/usr/local/opt/icu4c/lib"
# export CPPFLAGS="-I/usr/local/opt/icu4c/include"
# For pkg-config to find icu4c you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"

# krb5
# export PATH="/usr/local/opt/krb5/bin:$PATH"
# export PATH="/usr/local/opt/krb5/sbin:$PATH"
#For compilers to find krb5 you may need to set:
# export LDFLAGS="-L/usr/local/opt/krb5/lib"
# export CPPFLAGS="-I/usr/local/opt/krb5/include"
# For pkg-config to find krb5 you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/krb5/lib/pkgconfig"

# libffi
# For compilers to find libffi you may need to set:
# export LDFLAGS="-L/usr/local/opt/libffi/lib"
# export CPPFLAGS="-I/usr/local/opt/libffi/include"
# For pkg-config to find libffi you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"

# libressl
# export PATH="/usr/local/opt/libressl/bin:$PATH"
# For compilers to find libressl you may need to set:
# export LDFLAGS="-L/usr/local/opt/libressl/lib"
# export CPPFLAGS="-I/usr/local/opt/libressl/include"
# For pkg-config to find libressl you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/libressl/lib/pkgconfig"

# libxml2
# export PATH="/usr/local/opt/libxml2/bin:$PATH"
# For compilers to find libxml2 you may need to set:
# export LDFLAGS="-L/usr/local/opt/libxml2/lib"
# export CPPFLAGS="-I/usr/local/opt/libxml2/include"
# For pkg-config to find libxml2 you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig"

# llvm
# To use the bundled libc++ please add the following LDFLAGS:
  # LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include"


# ncurses
# export PATH="/usr/local/opt/ncurses/bin:$PATH"
# For compilers to find ncurses you may need to set:
# export LDFLAGS="-L/usr/local/opt/ncurses/lib"
# export CPPFLAGS="-I/usr/local/opt/ncurses/include"
# For pkg-config to find ncurses you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

# openjdk
#For the system Java wrappers to find this JDK, symlink it with
# sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
# For compilers to find openjdk you may need to set:
# export CPPFLAGS="-I/usr/local/opt/openjdk/include"

# openssl@1.1
# export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# For compilers to find openssl@1.1 you may need to set:
# export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# For pkg-config to find openssl@1.1 you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

# python@3.8
# export PATH="/usr/local/opt/python@3.8/bin:$PATH"
# For compilers to find python@3.8 you may need to set:
# export LDFLAGS="-L/usr/local/opt/python@3.8/lib"
# For pkg-config to find python@3.8 you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"

# qt
# export PATH="/usr/local/opt/qt/bin:$PATH"
# For compilers to find qt you may need to set:
# export LDFLAGS="-L/usr/local/opt/qt/lib"
# export CPPFLAGS="-I/usr/local/opt/qt/include"
# For pkg-config to find qt you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/qt/lib/pkgconfig"

# readline
# For compilers to find readline you may need to set:
# export LDFLAGS="-L/usr/local/opt/readline/lib"
# export CPPFLAGS="-I/usr/local/opt/readline/include"
# For pkg-config to find readline you may need to set:
# export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"

# z
. /usr/local/etc/profile.d/z.sh
# export _Z_DATA="$HOME/.z-history/.z"

# zsh-autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# z-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

# zsh history substring search
source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda activate py3
# <<< conda initialize <<<
export PATH="/usr/local/opt/texinfo/bin:$PATH"
