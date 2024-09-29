#!/bin/bash

init_rust_project(){
    [ $# -eq 0 ] && file="." || file=$1
    cargo init "$file"
    cd "$file" || exit
    cp -r "$HOME"/Templates/rust/.* .
}

init_ocaml_project(){
    dune init project "$1"
    cd "$1" || exit
    git init
    cp -r "$HOME"/Templates/ocaml/.* .
    cp -r "$HOME"/Templates/ocaml/* .
    mv template.opam "$1.opam"
    git init
}

init_c_project(){
    [ $# -eq 1 ] && mkdir "$1" && cd "$1" || exit
    cp -r "$HOME"/Templates/c/.* .
    cp -r "$HOME"/Templates/c/* .
    git init
}


init_latex_project(){
    [ $# -eq 1 ] && mkdir "$1" && cd "$1" || exit
    cp -r "$HOME"/Templates/latex/.* .
    cp -r "$HOME"/Templates/latex/* .
    mv Main.tex "$1.tex"
    sed -i "s/REPLACE_ME/$1/g" .github/workflows/*.yml
    sed -i "s/PROJECT_NAME/$1/g" "$1.tex"
    git init
    git submodule add https://github.com/Yag000/base-yago.git
    echo "\usepackage{base-yago/base-yago}" >> "$1.sty"
}


case $1 in
    rust) init_rust_project "$2" ;;
    ocaml) init_ocaml_project "$2" ;;
    c) init_c_project "$2" ;;
    latex) init_latex_project "$2" ;;
    *) echo "Usage: $0 {rust|ocaml|c|latex} [project_name]" ;;
esac
