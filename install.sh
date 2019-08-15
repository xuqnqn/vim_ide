#!/bin/bash

sudo apt-get remove vim-gnome
sudo apt-get remove vim-gtk
##sudo apt-get install vim-gnome
#sudo apt-get install vim-gtk
sudo apt-get install cscope exuberant-ctags

cp vimrc ~/.vimrc
sudo cp -r src_bin/bin/bin /opt
sudo cp -r src_bin/bin/share /opt
sudo cp sourceInsight.sh /opt/bin/
echo export PATH=/opt/bin:$PATH >> ~/.bashrc
