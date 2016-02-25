#!/bin/bash

cd ~
rm -rf .bash .bashrc .gitconfig .vim
ln -s dotfiles/.bash
ln -s dotfiles/.bash/bashrc .bashrc
ln -s dotfiles/.gitconfig
ln -s dotfiles/.vim
