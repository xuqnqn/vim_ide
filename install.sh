#!/bin/bash
VERSION=4.2
echo ===== version vim ide "$VERSION", by xuqnqn, `date` =========

sudo apt-get remove vim-gnome
sudo apt-get remove vim-gtk
##sudo apt-get install vim-gnome
#sudo apt-get install vim-gtk
sudo apt-get install cscope exuberant-ctags

cp vimrc ~/.vimrc
rm -rf ~/bin/vim_bin > /dev/null
mkdir -p ~/bin/vim_bin
cp -r src_bin/bin/* ~/bin/vim_bin
cp sourceInsight.sh ~/bin/vim_bin/bin/
echo export PATH=~/bin/vim_bin/bin:$PATH >> ~/.bashrc
echo ===== version vim ide "$VERSION", by xuqnqn, `date` ========= > ~/bin/vim_bin/version
echo Success!
