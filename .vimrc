
set number
set ruler

set incsearch
set hlsearch

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noswapfile

set autoindent

set autoread
set mouse=a

set foldmethod=marker

set clipboard+=unnamed


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

map g1 <Esc>o{<Esc>o}<Esc>ko<tab>
map g2 <Esc>A{<Esc>o}<Esc>ko<tab>
map g3 <Esc>^i<tab>/* <Esc>A */<Esc>
map g4 <Esc><<^<Esc>/\/\*<CR>3x<Esc>$? \*\/<CR>3x<Esc>

source ~/.vimfunc

map ;m :call Make()<CR>
map ;r :call RunIt()<CR>


