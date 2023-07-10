# update macOS, homebrew, conda

function macupdate() {
    sudo softwareupdate -ia
}

function brewupdate() {
    brew update
    brew upgrade
    brew cleanup
    rm -rf "$(brew --cache)"
    brew bundle dump --global --force
}

function condaupdate() {
    conda activate base
    conda update conda --yes
    conda update --all --yes
    conda activate py3
    conda update --all --yes
    conda clean --all --yes
}

function update() {
    macupdate
    brewupdate
    condaupdate
}

# Usage: txt2pdf [input file] [output file]
function txt2pdf(){
    ccat --html --bg=dark $1 > tmp.html
    wkhtmltopdf tmp.html $2
    rm tmp.html
}

function sortcat(){
    grep . $1 | sort
}

# Usage: flatten_dir [DIRECTORY]
function flatten_dir(){
    find $1 -mindepth 2 -type f -exec mv -i '{}' $1 ';'
}


function compresspdf() { # Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"ebook"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}


function compressvid() { # Usage: compressvid [input file] [output file]
    ffmpeg -i "$1" -c:v libx264 -b:v 1.5M -c:a aac -b:a 128k "$2"
    }

# vterm emacs
vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

function kube-conf () {
        RESOURCE=${1:-$AZ_RESOURCE}
        RESOURCE=${RESOURCE:-mo-develop}
        az aks get-credentials --name ${RESOURCE}-aks --resource-group ${RESOURCE}-resources
}

