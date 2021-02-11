#!/bin/bash

echo "trashing everything (lookout!)"
rm -rf bundle/*

cd bundle

# Essentials
git clone https://github.com/jamessan/vim-gnupg.git
git clone https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/scrooloose/nerdtree.git

# Obscure
git clone https://github.com/vim-scripts/VisIncr.git

# Gist
git clone https://github.com/mattn/gist-vim.git
git clone https://github.com/mattn/webapi-vim.git

# Syntax
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/tpope/vim-markdown.git
git clone https://github.com/rodjek/vim-puppet.git
curl "https://www.vim.org/scripts/download_script.php?src_id=15948" -o spamassassin.vim

# Colors
git clone https://github.com/dracula/vim.git dracula
git clone https://github.com/tomasr/molokai.git
git clone https://github.com/cocopon/iceberg.vim.git
curl "https://www.vim.org/scripts/download_script.php?src_id=6097" -o darkdot.vim
