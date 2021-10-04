#!/usr/bin/env bash

cd $(dirname "${0}")
echo "Switching to $PWD"

ln -sFv ${PWD}/vim ${HOME}/.vim
ln -sFv ${PWD}/vimrc ${HOME}/.vimrc
