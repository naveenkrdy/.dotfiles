#!/usr/bin/env bash

cd $(dirname "${0}")
echo $PWD

ln -sFv ${PWD}/.gitconfig ${HOME}/.gitconfig
ln -sFv ${PWD}/.gitignore ${HOME}/.gitignore
