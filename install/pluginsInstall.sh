#! /bin/bash

# get Base16 colorsheme
echo "get Base16 from github"
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# get tmux plugin manager
echo "get tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# get vundle
echo "get Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

