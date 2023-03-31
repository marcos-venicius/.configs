" By https://github.com/marcos-venicius

" plugins
call plug#begin()
  Plug 'doums/darcula'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
  Plug 'tpope/vim-commentary'
  Plug 'sheerun/vim-polyglot'

  " Omnisharp plugin to C-SHARP
  Plug 'OmniSharp/omnisharp-vim'

  " Icons
  Plug 'nvim-tree/nvim-web-devicons'
  " File explorer
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'antosha417/nvim-lsp-file-operations'

  Plug 'prabirshrestha/asyncomplete.vim'
call plug#end()


set expandtab
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

colorscheme darcula

filetype plugin indent on
filetype plugin detect
syntax on

hi Comment ctermfg=green
hi String ctermfg=120
hi Macro ctermfg=red
hi Number ctermfg=5

tnoremap <Esc> <C-\><C-n>

let mapleader=" "
let maplocalleader=" "

" autocmd
autocmd FileType csharp set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType *.cs set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
au BufRead,BufNewFile *.cs set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> gI <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> K <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>s <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>u <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs nmap <silent> <buffer> <Leader>lf <Plug>(omnisharp_code_format)
  autocmd FileType cs nmap <silent> <buffer> <Leader>r <Plug>(omnisharp_rename)
  autocmd FileType cs nmap <silent> <buffer> <Leader>a <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>a <Plug>(omnisharp_code_actions)
augroup END

" move lines
nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv

" comment/uncomment lines
nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>

" no hlsearch
nnoremap <leader><space> :nohlsearch<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>G <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

" Omnisharp
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winblend': 30,
  \ 'winhl': 'Normal:Normal,FloatBorder:ModeMsg',
  \ 'border': 'rounded'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0],
  \ 'border': [1],
  \ 'borderchars': ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
  \ 'borderhighlight': ['ModeMsg']
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

let g:OmniSharp_want_snippet = 0

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}

imap <c-space> <Plug>(asyncomplete_force_refresh)
imap <c-@> <Plug>(asyncomplete_force_refresh)
inoremap <expr><cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"
let g:asyncomplete_auto_popup = 1
