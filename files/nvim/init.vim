call plug#begin()
  " File explorer 
  Plug 'preservim/nerdtree'

  " Autocompletion
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Styled components
  Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }

  " Editor config
  Plug 'editorconfig/editorconfig-vim'  

  " Commet piece of code
  Plug 'tpope/vim-commentary'

  " Many languagues highlight
  Plug 'sheerun/vim-polyglot' 
call plug#end()

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

command! -nargs=0 MakeTags !ctags --recurse=yes --exclude=.git --exclude=BUILD --exclude=.svn --exclude=*.js --exclude=vendor/* --exclude=node_modules/* --exclude=db/* --exclude=log/* --exclude=\*.min.\* --exclude=\*.swp --exclude=\*.bak --exclude=\*.pyc --exclude=\*.class --exclude=\*.sln --exclude=\*.csproj --exclude=\*.csproj.user --exclude=\*.cache --exclude=\*.dll --exclude=\*.pdb
command! -nargs=1 FindWord :!grep -R --ignore-case --word-regexp --color -E --exclude-dir=node_modules --exclude-dir=.next --exclude-dir=.git <f-args>

set omnifunc=rescript#Complete
set completeopt+=preview
set expandtab
set path+=**
set nocursorline
set number
set relativenumber
set list 
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=eol:↴
set listchars+=nbsp:_
set mouse=a
set splitbelow
set splitright
set hidden
set inccommand=split
set nowrap
set clipboard+=unnamedplus
set ignorecase
set smartcase
set undodir=~/.config/nvim/undos
set undofile
set list!
set signcolumn=yes
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set updatetime=300

highlight clear SignColumn

syntax on
filetype plugin indent on
filetype plugin detect

let mapleader=" "
let maplocalleader=" "

" Save with CTRL+S
nmap <c-s> :w<cr>
imap <c-s> <Esc>:w<cr>a


" Move lines
nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv

" Zoom in
nnoremap zin <c-w>_ <c-w>\|
" Zoom out
nnoremap zout <c-w>= 

nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>

" Open config file
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>

" Load config file
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" COC
nnoremap <leader>fd <Plug>(coc-definition)
nnoremap <leader>ft <Plug>(coc-type-definition)
nnoremap <leader>fi <Plug>(coc-implementation)
nnoremap <leader>fr <Plug>(coc-references)
nnoremap <leader>c <Plug>(coc-codeaction-selected)<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Commentary
nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>

" no hlsearch
nnoremap <leader><space> :nohlsearch<cr>

" COC Diagnostics
nnoremap <leader>n :call CocAction('diagnosticNext')<CR>
nnoremap <leader>p :call CocAction('diagnosticPrevious')<CR>

" Nerd Tree
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap nf :NERDTreeFocus<CR>

" Map F2 to rename symbol
nmap <F2> <Plug>(coc-rename)

" ENTER confirm first item of list
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Refresh auto completions with CTRL+SPACE
inoremap <silent><expr> <c-space> coc#refresh()

" Format code with prettier
nnoremap <leader>i :CocCommand prettier.forceFormatDocument<CR>
