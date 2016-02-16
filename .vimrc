
:syntax on
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

set foldenable
set foldmethod=manual
set foldcolumn=0

set clipboard+=unnamed


set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

map ;1 <Esc>o{<Esc>o}<Esc>ko<tab>
map ;2 <Esc>A{<Esc>o}<Esc>ko<tab>
map ;3 <Esc>^i<tab>/* <Esc>A */<Esc>
map ;4 <Esc><<^3x<Esc>/\*\/<Return>h3x<Esc>
map ;0 <Esc>gg=G<Esc>
noremap ;s <esc>:<esc> 
noremap ;f <Esc>$zf%<Esc>
noremap ;e <Esc>zo<Esc>

source ~/.vimfunc

map ;m :call Make()<CR>
map ;r :call RunIt()<CR>
map ;t :sh<CR>


