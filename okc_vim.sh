#!/bin/sh

cp ./vimrc ~/.vimrc

wget -q "https://www.vim.org/scripts/download_script.php?src_id=11735" -O go.vim
sudo cp go.vim /usr/share/vim/vim74/syntax/
FTDETECT=~/.vim/ftdetect
if [ ! -d $FTDETECT ];then
mkdir $FTDETECT
fi
touch $FTDETECT/go.vim
echo "au BufRead,BufNewFile *.go set filetype=go" > ~/.vim/ftdetect/go.vim
