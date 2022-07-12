#!/usr/bin/env bash

source ../misc.sh

cd $(dirname "${0}") && echo "Switching to $PWD"

install_brew_pkg git

link "${PWD}/gitconfig" "${HOME}/.gitconfig"
link "${PWD}/gitignore" "${HOME}/.gitignore"
