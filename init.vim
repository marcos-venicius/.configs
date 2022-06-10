:set shiftwidth=2
:set expandtab
:set tabstop=2
:set path+=**
:set wildignore+=**/node_modules/**
:set background=dark
:set omnifunc=syntaxcomplete#Complete
:set autochdir
:set number
:set nowrap
:set splitright
:set termguicolors

filetype plugin on
filetype plugin indent on

autocmd Filetype cs setlocal tabstop=4

let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-l>'
let g:multi_cursor_select_all_word_key = '<C-s-l>'
let g:multi_cursor_start_key           = 'g<C-l>'
let g:multi_cursor_select_all_key      = 'g<C-s-l>'
let g:multi_cursor_next_key            = '<C-l>'
let g:multi_cursor_prev_key            = '<C-h>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

nnoremap nf :NERDTreeFocus<CR>
nnoremap nt :NERDTree<CR>
nnoremap ng :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

call plug#begin()
  Plug 'terryma/vim-multiple-cursors'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'dunstontc/vim-vscode-theme'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
nnoremap gp :Prettier<cr>

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <NUL> coc#refresh()

nnoremap <C-n> gt
nnoremap <C-p> gT

nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

colorscheme dark_plus

