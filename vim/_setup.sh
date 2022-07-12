#!/usr/bin/env bash

source ../misc.sh

install_brew_pkg vim

link "${PWD}/vim" "${HOME}/.vim"
link "${PWD}/vimrc" "${HOME}/.vimrc"
