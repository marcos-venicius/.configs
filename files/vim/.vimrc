let mapleader=' '
let maplocalleader=' '

set expandtab
set wildmenu
set hlsearch
set ruler
set nu
set rnu
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set autoindent
set path+=**
set nowrap
set smartcase
set ignorecase
set hidden
set splitbelow
set splitright
set nocursorline
set nobackup
set nowritebackup
set patchmode=off
set backupcopy=no
set backupskip=*
set backupdir=~/.vim/.backup/
set clipboard+=unnamedplus

filetype plugin indent on
filetype plugin detect
syntax on

hi CursorLine cterm=NONE ctermbg=008

nnoremap <leader><space> :nohlsearch<cr>

" quit from terminal mode with <ESC>
tnoremap <Esc> <C-\><C-n>

nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv

hi Comment ctermfg=green
hi String ctermfg=120
hi Macro ctermfg=red
hi Number ctermfg=blue
hi Include ctermfg=50
hi Identifier ctermfg=190

autocmd FileType csharp set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType *.cs set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
au BufRead,BufNewFile *.cs set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd FileType ruby set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType *.rb set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
au BufRead,BufNewFile *.rb set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

let g:netrw_keepdir = 0
let g:netrw_winsize = 30
let g:netrw_banner = 0
hi! link netrwMarkFile Search

nnoremap <Leader>f :Lexplore<CR>

let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
let g:netrw_liststyle = 3
