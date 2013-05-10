set history=1000

set noexpandtab
set tabstop=4
set shiftwidth=4

set wildmode=list:longest

" Enable display of line numbers
"set number
"set numberwidth=5

" Highlight current line
"set cursorline

" Window sizes
" Causes windows to resize in split view mode if there isn't
" enough space.
set winwidth=80
set winheight=5
set winminheight=5
set winheight=999

set ruler

set smartcase

set title

set noai
set hlsearch
syntax on

" For After Effects java script files
au BufNewFile,BufRead *.jsx set filetype=javascript


" wrap lines at 80 characters
"set textwidth=80

" execute current file
map ,e :wa\|!clear && ./%<CR>
" run make test
map ,t :wa\|!clear && make test<CR>
" comment from current location to mark a
map ,c :.,'as/^/#/<CR>:noh<CR>
" uncomment from current location to mark a
map ,u :.,'as/^#//<CR>:noh<CR>
" search for next python class definition
map ,cd /^\s*class\s<CR>
" search for next pythonfunction definition
map ,fd /^\s*def\s<CR>

