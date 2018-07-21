set nocp
filetype plugin on
set hls
set number
set background=dark
colorscheme darkblue

"set line auto indent
set ai

"convert tab to 4 space
set expandtab
set tabstop=4
retab

"######configure taglist
let Tlist_Ctags_cmd = $VIM.'/usr/bin/ctags'
"let Tlist_Sort_Type = "name"
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Auto_Open = 0
"let Tlist_Auto_Open = 1
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

" auto open nerdtree
"autocmd BufRead * . 
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" auto close nerdtree when the last windown is nerdtree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" let curser on left edit area when open
autocmd VimEnter * wincmd p

