call plug#begin('C:\Users\marco\Documents\vim-plugins')
  Plug 'sainnhe/sonokai'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'itchyny/lightline.vim'

  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'mangeshrex/uwu.vim'
  Plug 'prettier/vim-prettier', {'build': 'npm install'}
call plug#end()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <C-k><C-f> :NERDTreeToggle<CR>

set nu
set rnu
set nowrap
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set inccommand=split
set si
set cursorline
set updatetime=300
set shortmess+=c
set splitright
set splitbelow
set incsearch
set hlsearch
set title
set breakindent

nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap <C-i> :PrettierAsync <CR><ESC>

highlight CursorLine ctermfg=NONE ctermbg=black cterm=bold
highlight CursorLineNr ctermfg=white ctermbg=blue cterm=bold

set nobk nowb noswf noudf
set noeb vb t_vb=

if has('persistent_undo')         "check if your vim version supports
  set undodir=C:\Users\marco\Documents\temp     "directory where the undo files will be stored
  set undofile                    "turn on the feature
endif

filetype indent on
syntax on

let g:jsx_ext_required = 0

autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

autocmd bufnewfile,bufread *.js set filetype=javascriptreact

if has('termguicolors')
	set termguicolors
endif

" ---- sonokai
"let g:sonokai_style = 'default'
"let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1
"let g:sonokai_transparent_background = 1
"
"colorscheme sonokai

let g:UwuNR=1
colorscheme uwu

let g:vim_jsx_pretty_highlight_close_tag = 0
