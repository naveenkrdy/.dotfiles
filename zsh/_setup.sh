#!/usr/bin/env bash

cd $(dirname "${0}")
echo $PWD

ln -sFv ${PWD}/.zsh ${HOME}/.zsh
ln -sFv ${PWD}/.zshrc ${HOME}/.zshrc
