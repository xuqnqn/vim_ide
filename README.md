======> 快速安装gvim + vimgdb步骤：
1. move this folder to ~/.vim
2. run the following command:
   sudo ./install.sh
3. in each source file folder, can run "source_insght.sh" to generate cscope files. "source_insight.sh clean" to clean cscope files.
4. gvim source file, it will auto load cscope file.




======> 编译gvim + vimgdb步骤：
sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial

sudo apt-get build-dep vim

git clone https://github.com/cpiger/vimgdb-for-vim7.4.git

wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2

cd vim74/..    ;  patch -p0 < vimgdb-for-vim7.4/vim74.patch 

comment BINDIR, MANDIR, DATADIR in src/Makefile to customize install dir by --prefix

./configure --enable-multibyte --enable-fontset --enable-cscope --enable-gui=gtk2 --with-features=big --with-features=huge       --enable-gdb --with-compiledby=dong 

make CFLAGS="-O2 -D_FORTIFY_SOURCE=1" -j4

make install

cp vimgdb-for-vim7.4/vimgdb_runtime/* ~/.vim/ -r

gvim 中敲  :helptags ~/.vim/doc 

gvim中敲   :help vimgdb

gvim中敲   :run macros/gdb_mappings.vim 加载gdb mapping, 加载后，一些按键就被定义为调试命令(vimgdb定义的键绑定见":help gdb-mappings")。按<F7>可以在按键的缺省定义和调试命令间切换

分隔出一个名为gdb-variables的窗口,输入vim命名 :bel 20vsplit gdb-variables，用"v"命令选中变量i，按"CTRL-P"命令，把变量i加入到监视窗口，也可以在vimgdb 命令窗口输入createvar *r ，把*r加入变量窗口




======> vimgdb 的使用命令：
:help gdb-mappings
:help vimgdb
:run macros/gdb_mappings.vim

The key <F7> is used to toggle between the 'gdb_mappings.vim' mappings and the
default Vim mappings.

List of key mappings in 'gdb_mappings.vim':

	<Space> launch the interactive gdb input-line window
	CTRL-Z  send an interrupt to GDB and the program it is running
	B	info breakpoints
	L	info locals
	A	info args
	S	step
	I	stepi
	CTRL-N	next: next source line, skipping all function calls
	X	nexti
	F	finish
	R	run
	Q	quit
	C	continue
	W	where	---> bt
	CTRL-U	up: go up one frame
	CTRL-D	down: go down one frame
	CTRL-B	set a breakpoint on the line where the cursor is located
	CTRL-E	clear all breakpoints on the line where the cursor is located
	CTRL-P	Normal mode: print value of word under cursor
		Visual mode: GDB command "createvar" selected expression, see
		|gdb-variables|
	CTRL-X	print value of data referenced by word under cursor

    CTRL-B and CTRL-E operate both on source code and on disassembled code in
        assembly buffers.

    vimgdb窗口中，连续两次ctrl + c可以interrupt程序执行。

XUQNQN

git push origin ide_4.1

git checkout remotes/origin/ide_4.1
git checkout master
git branch -d ide_4.1
git branch -t ide4.1 remotes/origin/ide_4.1
git checkout ide4.1
git add README.md
git commit -m "test branch"
git push origin HEAD:ide_4.1

