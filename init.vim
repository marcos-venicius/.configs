call plug#begin()
  Plug 'jaredgorski/spacecamp'
  Plug 'morhetz/gruvbox'
  Plug 'pantharshit00/vim-prisma'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes' 
  Plug 'pangloss/vim-javascript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }
  Plug 'sheerun/vim-polyglot' 
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-commentary'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'editorconfig/editorconfig-vim'  
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'lambdalisue/fern.vim'
  Plug 'preservim/nerdtree'
call plug#end()

syntax on

set background=dark
let g:indentLine_setColors = 1
let g:indentLine_color_term = 237

function! s:h(group, style)
 execute "highlight" a:group
  \ "guifg=" (has_key(a:style, "fg")    ? a:style.fg   : "NONE")
  \ "guibg=" (has_key(a:style, "bg")    ? a:style.bg   : "NONE")
  \ "guisp=" (has_key(a:style, "sp")    ? a:style.sp   : "NONE")
  \ "gui="   (has_key(a:style, "gui")   ? a:style      : "NONE")
endfunction

call s:h("ColorColumn", { "bg": "#444444" })

let g:vim_jsx_pretty_highlight_close_tag = 0
let g:vim_jsx_pretty_colorful_config = 1

let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.notexists = ' ✗'
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

let g:fzf_preview_window = []

let $FZF_DEFAULT_OPTS="--preview-window 'right:60%' --layout reverse --margin=0,0 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

let g:fzf_layout = 
\ { 'window': 
  \ { 'width': 0.98, 'height': 0.7, 'yoffset': 0.94, 'border': 'rounded' } 
\ } 

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

set omnifunc=rescript#Complete
set completeopt+=preview
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set path+=**
se cursorline
set number
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
highlight clear SignColumn

let mapleader=" "
let maplocalleader=" "

nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>
nnoremap <leader><space> :nohlsearch<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>yf :let @+ = expand("%")<cr>
nnoremap <c-p> :Files<cr>
nnoremap <s-m-p> :GFiles<cr>
nnoremap <c-o> :Buffers<cr>
nnoremap go :ls<cr>:b
nnoremap gv :ls<cr>:vsplit \| b
nnoremap gh :ls<cr>:split \| b
nnoremap zin <c-w>_ <c-w>\|
nnoremap zni <c-w>= 
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>
nmap <c-s> :w<cr>
imap <c-s> <Esc>:w<cr>a
nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv
nnoremap <c-s-m-p> <Nop>
nnoremap <c-s-m-e> <Nop>
nnoremap <m-0> <Nop>
nnoremap <m-1> <Nop>
nnoremap <m-2> <Nop>
nnoremap <m-3> <Nop>
nnoremap nf :NERDTreeFocus<CR>
nnoremap nt :NERDTree<CR>
nnoremap ng :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

nmap <F2> <Plug>(coc-rename)

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <leader>i :Prettier <CR>

nmap <leader>c <Plug>(coc-codeaction-selected)<cr>

nnoremap <leader>n :call CocAction('diagnosticNext')<CR>
nnoremap <leader>p :call CocAction('diagnosticPrevious')<CR>

" colorscheme gruvbox
colorscheme spacecamp
let g:airline_theme='onedark'
