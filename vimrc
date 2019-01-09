set nocp
filetype plugin on
set hls
set number
set background=dark
colorscheme darkblue
syntax on

"set line auto indent
set ai

"set cul "高亮光标所在行
"set cuc "高亮光标所在列
"自动保存
set autowrite
"禁止生成临时文件
set nobackup
set noswapfile

"convert tab to 4 space
set nu ru ai si ts=4 sw=4
set tabstop=4
set expandtab
retab

"######configure taglist
let Tlist_Ctags_cmd = $VIM.'/usr/bin/ctags'
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Enable_Fold_Column = 1
let Tlist_Auto_Open = 0
let Tlist_Show_One_file = 1
let Tlist_Use_SingleClick = 1


"######configure cscope
"set cscopequickfix=s-,c-,d-,i-,t-,e-
execute "cscope add ./cscope.out"

"global definition
nmap <F5> :cs find s <C-R>=expand("<cword>")<CR><CR>
"reference
nmap <F4> :cs find c <C-R>=expand("<cword>")<CR><CR>
"definition
nmap <F3> :cs find g <C-R>=expand("<cword>")<CR><CR>
"file
nmap <F6> :cs find f <C-R>=expand("<cfile>")<CR><CR>
"match
nmap <F2> :/<C-R>=expand("<cword>")<CR><CR>
"folder
nmap <F10> zf% <CR>
"NERDTree explore window
nmap <F11> :NERDTreeToggle <CR>
"toggle taglist window
nmap <F12> :TlistToggle <CR>

"make
nmap <F9> :!make <CR>
"run
nmap <F8> :!./%:r <CR>
"save
nmap <F1> :w <CR>

"gdb
"nmap <F7> :!gdb -q ./%:r <CR>
""""""""""""""""""""""""""""""
" vimgdb setting
""""""""""""""""""""""""""""""
let g:vimgdb_debug_file = ""
run macros/gdb_mappings.vim

"######configure MiniBufExplorer 
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1 
let g:miniBufExplUseSingleClick = 1


"avoid NERDTreeDirArrows to be a meesy
set encoding=utf-8

"use +/- or arrow
let g:NERDTreeDirArrows=0

"file filter, use regular expression in [], ignore suffix with: .o, .ko, .gz
let NERDTreeIgnore = ['.*\.o$','.*\.ko$','.*\.gz$']

" auto open nerdtree
"autocmd BufRead * . 
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" auto close nerdtree when the last windown is nerdtree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" let curser on left edit area when open
autocmd VimEnter * wincmd p

"let g:edit ++enc=gb18030
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set termencoding=utf-8
"set encoding=utf-8


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.cc,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
        "如果文件类型为.sh文件 
        if &filetype == 'sh' 
                call setline(1,"\#!/bin/bash") 
                call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
            call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
            call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
        else 
                call setline(1, "/*************************************************************************") 
                call append(line("."),   "      > File Name: ".expand("%")) 
                call append(line(".")+1, "      > Author: Xu Qingqing") 
                call append(line(".")+2, "      > Mail: xuqnqn@qq.com") 
                call append(line(".")+3, "      > Created Time: ".strftime("%c")) 
                call append(line(".")+4, " ************************************************************************/") 
                call append(line(".")+5, "")
        endif
        if expand("%:e") == 'cpp'  
                call append(line(".")+6, "#include <iostream>")
                call append(line(".")+7, "using namespace std;")
                call append(line(".")+8, "")
                call append(line(".")+9, "int main(int argc, char **argv, char **env)")
                call append(line(".")+10, "{")
                call append(line(".")+11, "")
                call append(line(".")+12, "    return 0;")
                call append(line(".")+13, "}")
        endif
        if expand("%:e") == 'cc' 
                call append(line(".")+6, "#include <iostream>")
                call append(line(".")+7, "using namespace std;")
                call append(line(".")+8, "")
                call append(line(".")+9, "int main(int argc, char **argv, char **env)")
                call append(line(".")+10, "{")
                call append(line(".")+11, "")
                call append(line(".")+12, "    return 0;")
                call append(line(".")+13, "}")
        endif    
        if &filetype == 'c'
                call append(line(".")+6, "#include <stdio.h>")
                call append(line(".")+7, "")
                call append(line(".")+8, "")
                call append(line(".")+9, "int main(int argc, char **argv)")
                call append(line(".")+10, "{")
                call append(line(".")+11, "")
                call append(line(".")+12, "    return 0;")
                call append(line(".")+13, "}")
        endif
        if expand("%:e") == 'h'
                call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
                call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
                call append(line(".")+8, "")
                call append(line(".")+9, "#endif")
        endif
        if &filetype == 'java'
                call append(line(".")+6,"public class ".expand("%:r"))
                call append(line(".")+7,"")
        endif
        "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G



