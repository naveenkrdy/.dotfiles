#!/usr/bin/env bash

cd $(dirname "${0}")
echo $PWD

ln -sFv ${PWD}/.vim ${HOME}/.vim
ln -sFv ${PWD}/.vimrc ${HOME}/.vimrc
