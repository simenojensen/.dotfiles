# Homebrew
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=2

# Set LC types
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Coreutils
export PATH=$(brew --prefix)"/opt/coreutils/libexec/gnubin:$PATH"

# DocBook
export XML_CATALOG_FILES=$(brew --prefix)"/etc/xml/catalog"

# Hdf5
export HDF5_DIR=$(brew --prefix hdf5)

# Emacs Shell
# This allows running `shell` properly within Emacs
# if [ -n "$INSIDE_EMACS" ]; then
  # export TERM=dumb
# else
  # export TERM=xterm-256color
# fi

# Perl
# By default non-brewed cpan modules are installed to the Cellar. If you wish
# for your modules to persist across updates we recommend using `local::lib`.
# You can set that up like this:
# PERL_MM_OPT="INSTALL_BASE=$HOME/.perl5" cpan local::lib
eval "$(perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5)"

# Findutils
export PATH=$(brew --prefix)"/opt/findutils/libexec/gnubin:$PATH"

# GNU Getopt
export PATH=$(brew --prefix)"/opt/gnu-getopt/bin:$PATH"

# GNU sed
PATH=$(brew --prefix)"/opt/gnu-sed/libexec/gnubin:$PATH"

# apr
# export PATH=$(brew --prefix)"/opt/apr/bin:$PATH"

# apr-util
# export PATH=$(brew --prefix)"/opt/apr-util/bin:$PATH"

# m4
export PATH="$PATH:/opt/homebrew/opt/m4/bin"

# icu4c
# export PATH=$(brew --prefix)"/opt/icu4c/bin:$PATH"
# export PATH=$(brew --prefix)"/opt/icu4c/sbin:$PATH"
# For compilers to find icu4c you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/icu4c/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/icu4c/include"
# For pkg-config to find icu4c you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/icu4c/lib/pkgconfig"

# krb5
# export PATH=$(brew --prefix)"/opt/krb5/bin:$PATH"
# export PATH=$(brew --prefix)"/opt/krb5/sbin:$PATH"
#For compilers to find krb5 you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/krb5/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/krb5/include"
# For pkg-config to find krb5 you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/krb5/lib/pkgconfig"

# libffi
# For compilers to find libffi you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
# For pkg-config to find libffi you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/libffi/lib/pkgconfig"

# libressl
# export PATH=$(brew --prefix)"/opt/libressl/bin:$PATH"
# For compilers to find libressl you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/libressl/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libressl/include"
# For pkg-config to find libressl you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/libressl/lib/pkgconfig"

# libxml2
# export PATH=$(brew --prefix)"/opt/libxml2/bin:$PATH"
# For compilers to find libxml2 you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/libxml2/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/libxml2/include"
# For pkg-config to find libxml2 you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/libxml2/lib/pkgconfig"

# llvm
LDFLAGS="-L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"

# ncurses
# export PATH=$(brew --prefix)"/opt/ncurses/bin:$PATH"
# For compilers to find ncurses you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/ncurses/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/ncurses/include"
# For pkg-config to find ncurses you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/ncurses/lib/pkgconfig"

# openjdk
#If you need to have openjdk first in your PATH, run:
export PATH=$(brew --prefix)"/opt/openjdk/bin:$PATH"
# For compilers to find openjdk you may need to set:
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

# openssl@1.1
# export PATH=$(brew --prefix)"/opt/openssl@1.1/bin:$PATH"
# For compilers to find openssl@1.1 you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
# For pkg-config to find openssl@1.1 you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/openssl@1.1/lib/pkgconfig"

# python@3.8
# export PATH=$(brew --prefix)"/opt/python@3.8/bin:$PATH"
# For compilers to find python@3.8 you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/python@3.8/lib"
# For pkg-config to find python@3.8 you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/python@3.8/lib/pkgconfig"

# qt
# export PATH=$(brew --prefix)"/opt/qt/bin:$PATH"
# For compilers to find qt you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/qt/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/qt/include"
# For pkg-config to find qt you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/qt/lib/pkgconfig"

# readline
# For compilers to find readline you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
# For pkg-config to find readline you may need to set:
# export PKG_CONFIG_PATH=$(brew --prefix)"/opt/readline/lib/pkgconfig"

# ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export GEM_HOME="$HOME/.gem"

# CSV diff
# export PATH="$HOME/.gem/bin/:$PATH"

# golang
export GOPATH=$HOME/.go
# export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:$(brew --prefix golang)/libexec/bin"
export PATH="$PATH:$(go env GOPATH)/bin"

# epdfinfo - emacs pdftools
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:$(brew --prefix libffi)/lib/pkgconfig/:/opt/homebrew/Cellar/zlib/1.2.13/lib/pkgconfig:/opt/homebrew/lib/pkgconfig:/opt/X11/lib/pkgconfig"

# Iccube
export ICCUBE_HOME="/Volumes/icCube_6.8.5/"

# mysql
# https://bugs.mysql.com/bug.php?id=102364
# This is my temporary solution:
# MySQLWorkbench need Python3.7 Framework in /Library/Frameworks/
# 1. brew install python@3.7
# 2. sudo cp -r /opt/homebrew/Cellar/python@3.7/3.7.9_3/Frameworks/Python.framework /Library/Frameworks/Python.framework
# 3. open MySQLWorkbench, it's work

# z
. /opt/homebrew/etc/profile.d/z.sh
# export _Z_DATA="$HOME/.z-history/.z"

# zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# z-completions
# To activate these completions, add the following to your .zshrc:
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi
# You may also need to force rebuild `zcompdump`:
#   rm -f ~/.zcompdump; compinit
# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:
#   chmod -R go-w '/opt/homebrew/share/zsh'

# zsh history substring search
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# zsh syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# # fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
