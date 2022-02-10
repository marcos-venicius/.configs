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
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
call plug#end()

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <silent> <C-k><C-f> :NERDTreeToggle<CR>

lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } } 
EOF

nnoremap <C-f> :Telescope find_files<cr>
nnoremap <C-g> :Telescope live_grep<cr>
nnoremap <C-b> :Telescope buffers<cr>
nnoremap <C-t> :Telescope help_tags<cr>

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

nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"<CTRL-SPACE> to refresh autocompletion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> B :Buffers <CR>

"enter to confirm selection
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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


set path+=**
