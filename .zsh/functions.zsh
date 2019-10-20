# update macOS, homebrew, conda

function macupdate() {
    sudo softwareupdate -ia
}

function brewupdate() {
    brew update
    brew upgrade
    brew cask upgrade
    brew cleanup
    brew bundle dump --global --force
}

function condaupdate() {
    conda deactivate
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

function cat2pdf(){
    ccat --html --bg=dark $1 > tmp.html
    wkhtmltopdf tmp.html $1".pdf"
    rm tmp.html
}

    

