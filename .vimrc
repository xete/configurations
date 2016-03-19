" a must of vim
:syntax on
" for char count and direct info of current position
set number
set ruler

" incremental search to clean search, avoid the polution of highlight
set incsearch
set hlsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
" no swapfile introduce a risk of missing the content
" you are editing currently
set noswapfile

set autoindent

set autoread
set mouse=a

set foldenable
set foldmethod=manual
set foldcolumn=0

set clipboard+=unnamed


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" ;1 for function definition
" ;2 for subprocess
" ;3 comment pattern /* comment */
" ;4 uncomment
map ;1 <Esc>o{<Esc>o}<Esc>ko<tab>
map ;2 <Esc>A{<Esc>o}<Esc>ko<tab>
map ;3 <Esc>^i<tab>/* <Esc>A */<Esc>
map ;4 <Esc><<^3x<Esc>/\*\/<Return>h3x<Esc>
" ;0 rearrange
map ;0 <Esc>gg=G<Esc>
" ;s silent
" ;f fold and ;e expand
" ;p paste system clipboard, avoid introducing some shitespace
noremap ;s <esc>:<esc> 
noremap ;f <Esc>$zf%<Esc>
noremap ;e <Esc>zo<Esc>
noremap ;p <Esc>:set paste<Return>"+p<Return>:set nopaste<Return>

source ~/.vimfunc

" ;m compile
" ;r run the code
" ;t easy access outside the file
map ;m :call Make()<CR>
map ;r :call RunIt()<CR>
map ;t :sh<CR>


