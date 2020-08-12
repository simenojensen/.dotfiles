# update macOS, homebrew, conda

function macupdate() {
    sudo softwareupdate -ia
}

function brewupdate() {
    brew update
    brew upgrade
    brew cask upgrade
    brew cask upgrade $(brew cask outdated)
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


function compresspdf() { # Usage: compresspdf [input file] [output file] [screen*|ebook|printer|prepress]
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"ebook"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}


function compressvid() { # Usage: compressvid [input file] [output file]
    ffmpeg -i "$1" -c:v libx264 -b:v 1.5M -c:a aac -b:a 128k "$2"
    }
