execute pathogen#infect()

set number		"Line numbers
set autoread		"Reload files changed outside vim
set ruler
set noerrorbells
set colorcolumn=80

set noswapfile
set nobackup

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent

"===== better splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"==================== NerdTree ====================
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

"open when no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"File Type settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.rb,*.rake setlocal et ts=2 sw=2 sts=2
au BufNewFile,BufRead *.py setlocal et ts=4 sw=4 sts=4
au BufNewFile,BufRead *.yml,*.yaml setlocal et ts=2 sw=2
au BufNewFile,BufRead *.cpp,*.hpp setlocal et ts=2 sw=2
au BufNewFile,BufRead *.json setlocal et ts=2 sw=2
au BufNewFile,BufRead *.js setlocal et ts=2 sw=2

au FileType nginx setlocal noet ts=4 sw=4 sts=4
autocmd FileType dockerfile set noet ts=4 sw=4 sts=4
autocmd FileType Makefile set noet ts=4 sw=4 sts=4
