" By https://github.com/marcos-venicius

call plug#begin()
  Plug 'nvim-lua/plenary.nvim'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
  Plug 'tpope/vim-commentary'
  Plug 'sheerun/vim-polyglot'
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'f-person/git-blame.nvim'
  Plug 'Mofiqul/vscode.nvim'
  Plug 'slugbyte/yuejiu'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'ericbn/vim-solarized'
  Plug 'gouch/vim-ballroom'
  Plug 'navarasu/onedark.nvim'
  Plug 'xiyaowong/transparent.nvim'
call plug#end()

colorscheme onedark

let g:OmniSharp_server_use_net6 = 1
let g:onedark_terminal_italics = 1
let g:coc_global_extensions = ['coc-tsserver', 'coc-solargraph', 'coc-jedi', 'coc-css', 'coc-emmet', 'coc-prettier', 'coc-json']
let g:markdown_fenced_languages = ['html', 'python', 'lua', 'vim', 'typescript', 'javascript']

let g:onedark_config = {
  \ 'transparent': 1,
  \ 'style': 'deep',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:true,
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false,
  \ },
\ }

set background=dark
set expandtab
set hlsearch
set ruler
set nu
set rnu
set cursorline
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
set signcolumn=no
set splitbelow
set splitright
set termguicolors

filetype plugin indent on
filetype plugin detect
syntax on

tnoremap <Esc> <C-\><C-n>

let mapleader=" "
let maplocalleader=" "

nnoremap <leader>d :CocDiagnostics<CR>

autocmd FileType csharp set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
autocmd FileType *.cs set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
au BufRead,BufNewFile *.cs set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" break the line with 120 chars
nnoremap <leader>l 120lwhdli<CR><ESC>

nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv

nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>

nnoremap <leader><space> :nohlsearch<cr>

nnoremap <leader>F <cmd>Telescope find_files<cr>
nnoremap <leader>G <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

augroup javascript_commands
  autocmd!
  autocmd FileType javascript,typescript,typescriptreact nmap <silent> gd <Plug>(coc-definition)
  autocmd FileType javascript,typescript,typescriptreact nmap <silent> gy <Plug>(coc-type-definition)
  autocmd FileType javascript,typescript,typescriptreact nmap <silent> gI <Plug>(coc-implementation)
  autocmd FileType javascript,typescript,typescriptreact nmap <silent> gr <Plug>(coc-references)

  autocmd FileType javascript,typescript,typescriptreact nmap <leader>cl  <Plug>(coc-codelens-action)
  autocmd FileType javascript,typescript,typescriptreact nmap <leader>ca  <Plug>(coc-codeaction-source)
  autocmd FileType javascript,typescript,typescriptreact nmap <leader>cf  <Plug>(coc-fix-current)

  autocmd FileType javascript,typescript,typescriptreact nmap <leader>rn <Plug>(coc-rename)

  autocmd FileType javascript,typescript,typescriptreact nnoremap <silent> K :call ShowDocumentation()<CR>
  autocmd FileType javascript,typescript,typescriptreact nnoremap <leader>i :CocCommand prettier.forceFormatDocument<CR>
augroup END

augroup other_commands
  autocmd FileType markdown,md nnoremap <leader>i :CocCommand prettier.forceFormatDocument<CR>
augroup END

augroup csharp_commands
  autocmd!

  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>fu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>gI <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> K <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>u <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> K <Plug>(omnisharp_signature_help)
  autocmd FileType cs nnoremap <silent> K <Plug>(omnisharp_signature_help)

  autocmd FileType cs nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)

  autocmd FileType cs nmap <silent> <buffer> <Leader>i <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>rn <Plug>(omnisharp_rename)
augroup END

nnoremap <leader>r :NERDTreeFind<cr>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap <C-f> :NERDTreeToggle<CR>


let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}

