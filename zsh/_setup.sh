#!/usr/bin/env bash

cd $(dirname "${0}")
echo "Switching to $PWD"

ln -sFv ${PWD}/zsh ${HOME}/.zsh
ln -sFv ${PWD}/zshrc ${HOME}/.zshrc
