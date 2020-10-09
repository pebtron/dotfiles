#!/bin/bash

echo "trashing everything (lookout!)"
rm -rf bundle/*

cd bundle
git clone https://github.com/jamessan/vim-gnupg
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/godlygeek/tabular.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/rodjek/vim-puppet
git clone https://github.com/tsaleh/vim-tmux.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/tomasr/molokai.git
git clone https://github.com/nanotech/jellybeans.vim.git
git clone https://github.com/mattn/gist-vim.git
git clone https://github.com/mattn/webapi-vim.git
git clone https://github.com/plasticboy/vim-markdown.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/vim-scripts/VisIncr.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/cocopon/iceberg.vim
git clone https://github.com/dracula/vim.git dracula

curl "https://www.vim.org/scripts/download_script.php?src_id=6097" -o darkdot.vim
curl "https://www.vim.org/scripts/download_script.php?src_id=15948" -o spamassassin.vim
