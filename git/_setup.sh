#!/usr/bin/env bash

cd $(dirname "${0}")
echo "Switching to $PWD"

ln -sFv ${PWD}/gitconfig ${HOME}/.gitconfig
ln -sFv ${PWD}/gitignore ${HOME}/.gitignore
