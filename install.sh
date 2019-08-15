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
source ~/.bashrc
echo ===== version vim ide "$VERSION", by xuqnqn, `date` ========= > ~/bin/vim_bin/version

#for syntax error
cd /home/xuqnqn
mkdir -p work/vim_src/vim_bin/share/vim/
cp -r .vim/src_bin/bin/share/vim/vim74/syntax/ work/vim_src/vim_bin/share/vim/

##for color error
#cd /home/xuqnqn/.vim
#cp -r ./src_bin/bin/share/vim/vim74/colors .


echo Success!
