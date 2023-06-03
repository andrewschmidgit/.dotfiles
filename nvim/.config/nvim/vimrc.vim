let mapleader = " "

noremap <leader>w :w<cr>
set relativenumber
set number
set showcmd

" Clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

set ignorecase
set smartcase
set hlsearch

" Moves current line up and down
nnoremap <A-j> mz:m+<Enter>`z
nnoremap <A-k> mz:m-2<Enter>`z

" Moves all selected lines up and down, and keeps cursor position
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" When navigating up or down centers the cursor
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Leaves cursor where it was before joining line below
nnoremap J mzJ`z
