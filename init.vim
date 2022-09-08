" Plugins --------------------------------------------------------------------

call plug#begin()
  Plug 'KabbAmine/yowish.vim'	

  " Prisma code highlight
  Plug 'pantharshit00/vim-prisma'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes' 

  " Suporte à liguagem JavaScript
  Plug 'pangloss/vim-javascript'

  " Suporte para Styled Components
  Plug 'styled-components/vim-styled-components', { 'branch': 'develop' }

  " Adicionar syntax hightlight para várias linguagens
  Plug 'sheerun/vim-polyglot' 

  " === 
  " Início da instalação do fzf
  " O fzf serve para fazer buscas no estilo do sublime text, com Ctrl + P
  " Antes de instalar, leia a documentação e instale as dependências
  " necessárias.
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
  Plug 'junegunn/fzf.vim'
  " Final da instalação do fzf
  " ===

  " Adicionar comentários em várias linguagens
  Plug 'tpope/vim-commentary'

  " Fazer fechamento automático de pares (parênteses, colchetes, aspas, etc)
  Plug 'jiangmiao/auto-pairs'

  " Facilitar manipulação de 'surroundings' (pares)
  Plug 'tpope/vim-surround'

  " Editorconfig
  Plug 'editorconfig/editorconfig-vim'  

  " Conquer of Completation - autocomplete - intelisense engine
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Melhorar netw
  Plug 'lambdalisue/fern.vim'
 
  Plug 'preservim/nerdtree'
call plug#end()

" Cores ----------------------------------------------------------------------

" Habilita syntax highlight
syntax on

" Define o background para temas escuros. Usar `light` para temas claros
set background=dark

" Define se a cor usada pelo indentLine vai seguir o tema (0) ou o padrão do
" indentLine (1), que é cinza
let g:indentLine_setColors = 1

" Define a cor da linha
let g:indentLine_color_term = 237

" " Função utilitária para gerar o tema

function! s:h(group, style)
 execute "highlight" a:group
  \ "guifg=" (has_key(a:style, "fg")    ? a:style.fg   : "NONE")
  \ "guibg=" (has_key(a:style, "bg")    ? a:style.bg   : "NONE")
  \ "guisp=" (has_key(a:style, "sp")    ? a:style.sp   : "NONE")
  \ "gui="   (has_key(a:style, "gui")   ? a:style      : "NONE")
endfunction

call s:h("ColorColumn", { "bg": "#444444" })

" Configuração do plugin polyglot para JSX (vim-jsx-pretty) ------------------

let g:vim_jsx_pretty_highlight_close_tag = 0
let g:vim_jsx_pretty_colorful_config = 1

" Configurações do plugin Airline --------------------------------------------

" Permitir fontes Powerline
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.notexists = ' ✗'

" Configuração do plugin de smooth scroll ------------------------------------

" Permite que o cursor acompanhe a rolagem da tela
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

" Configuração do plugin COC -------------------------------------------------

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Usar o K maiúsculo para exibir a documentação
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

" Atalho para abrir :CocAction
nmap <leader>ac <Plug>(coc-codeaction)

" Atalho para aplicar autofix no problema da linha selecionada
nmap <leader>qf <Plug>(coc-fix-current)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Configuração do FZF --------------------------------------------------------
" Não exibir janela de pré-visualização de conteúdo do arquivo
let g:fzf_preview_window = []

" Syntax Highlight e configs default para janela de pré-visualização
let $FZF_DEFAULT_OPTS="--preview-window 'right:60%' --layout reverse --margin=0,0 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" Posicionamento da janela do FZF
" let g:fzf_layout = { 'down': '50%' }

" Posicionamento da janela do FZF (v2)
let g:fzf_layout = 
\ { 'window': 
  \ { 'width': 0.98, 'height': 0.7, 'yoffset': 0.94, 'border': 'rounded' } 
\ } 

" Cores do FZF devem casar com as cores do tema
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

" Autocomplete
set omnifunc=rescript#Complete

" When preview is enabled, omnicomplete will display additional
" information for a selected item
set completeopt+=preview

" Espaços e Tabs -------------------------------------------------------------

" Define tabs como espaços
set expandtab

" Número de espaços visuais ao pressionar a tecla TAB
set tabstop=2

" Número de espaços contados em uma tabulação quando estiver editando
set softtabstop=2

" Número de espaços contados em uma tabulação em nova linha
set shiftwidth=2

" Relative path
set path+=**

" UI e Layout ----------------------------------------------------------------

" Marcar linha atual
set nocursorline

" exibir números de linhas
set number

" Habilita a exibição de caracteres ocultos
set list 

" Define como os símbolos ocultos serão representados
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=eol:↴
set listchars+=nbsp:_

" Pode deixar o nvim lento, mas garantido que syntax highlight vai 
" sempre funcionar
" autocmd BufEnter * :syntax sync fromstart

" Habilita o mouse no modo de inserção
" i = insert
" v = visual
" a = all (todos os modos)
set mouse=a

" Misc ----------------------------------------------------------------------

" Fazer split horizontal para baixo
set splitbelow

" Fazer split vertical para a direita
set splitright

" permite editar outros arquivos sem salvar um antes de abrir outro
set hidden

" permite ter uma pré-visualização antes de fazer uma substituição com :%s
set inccommand=split

" Não quebrar linhas por padrão. Para definir quebra de linha, só entrar no
" arquivo e digitar :set wrap
set nowrap

" Permite copiar do clipboard para o vim e do vim para o clipboard
set clipboard+=unnamedplus

" Ignora maiúsculas e minúsculas para buscas
set ignorecase

" Sobrescreve o `ignorecase` quando houver caracteres em maísuculo na busca 
set smartcase

" Define diretório para salvar histórico de `desfazer`
set undodir=~/.config/nvim/undos

" Salva automaticamente um histórico de ações para `desfazer`, ainda que o vim
" seja fechado
set undofile

" Não exibe símbolos ocultos por default
set list!

" Sempre exibir a sign column (coluna com os símbolos de erro e warning)
set signcolumn=yes
highlight clear SignColumn
" Atalhos com a tecla <leader> ----------------------------------------------

" Defineva tecla `leader` como a vírgula
let mapleader=","

" Define a tecla `localleader` como o ponto-e-vírgula
let maplocalleader=";"

" Atalho para edição do arquivo de configuração do neovim. Só pressionar
" a tecla <leader> e digitar `ev` (edit vim) no modo normal
nnoremap <leader>ev :e ~/.config/nvim/init.vim<cr>

"Atalho para recarregar o vim após uma edição no arquivo de configuração
"(source vim) - <leader> seguido de `sv`
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>


" Comentar linhas usando <leader>v+ /
nnoremap <leader>/ :Commentary<cr>
vnoremap <leader>/ :Commentary<cr>

" Remover highlight da busca com <leader><space>
nnoremap <leader><space> :nohlsearch<cr>

" Toggle para exibir / esconder símbolos ocultos
nnoremap <leader>l :set list!<cr>

" Copiar caminho do arquivo atual com <leader>yf (yank filename)
" " relative path
" :let @+ = expand("%")
" " full path
" :let @+ = expand("%:p")

" " just filename
" :let @+ = expand("%:t")
nnoremap <leader>yf :let @+ = expand("%")<cr>

" Outros atalhos -------------------------------------------------------------

" Define o atalho Ctrl + P para utilizar o fzf 
nnoremap <c-p> :Files<cr>

" Define o atalho Shift + Meta(Alt) + P para utilizar o fzf com base no git
nnoremap <s-m-p> :GFiles<cr>

" Define o atalho Ctrl + N para abrir :Buffers com o fzf
nnoremap <c-o> :Buffers<cr>

" Lista todos os buffers com `go` e aceita um novo buffer como argumento
nnoremap go :ls<cr>:b

" Lista todos os buffers com `gv` e aceita um para abrir na vertical
nnoremap gv :ls<cr>:vsplit \| b

" Lista todos os buffers com `gh` e aceita um para abrir na horizontal
nnoremap gh :ls<cr>:split \| b

" Zoom in em split - [z]oom [in]
" Os comandos padrão para dar zoom em split são:
" - Ctrl + W + _ = Define o split atual com a maior altura possível
" - Ctrl + W + | = Define o split atual com a maior largura possível
" - Ctrl + W + = = Tenta definir todas as janelas com o mesmo tamanho
nnoremap zin <c-w>_ <c-w>\|

" Zoom out - [z]oom [n]ot [i]n
" não usei `zo` pq conflita com o atalho de folding
nnoremap zni <c-w>= 

" Toggle para conceallevel
" conceallevel serve para deixar algumas coisas mais "humanamente visíveis". 
" Exemplo:
" em um arquivo markdown, ao invés de exibir um link completo, que pode ficar
" ruim de ler, com o conceallevel setado para `2`, o link é exibido apenas com
" o texto, e um underline, ao invés da sintaxe completa de [texto](http://link)
" Mas temos que desabilitar se precisarmos editar o link. O conceallevel é
" usado também por outros plugins, como o indentLine para exibir as linhas de
" indentação, por isso é legal manter ele ativo, mas ter uma opção rápida para
" desabilitar quando necessário.
nnoremap coe :setlocal conceallevel=<c-r>=&conceallevel == 0 ? '2' : '0'<cr><cr>

" Salvar usando CTRL + S
nmap <c-s> :w<cr>
imap <c-s> <Esc>:w<cr>a

" Mover linha ou bloco de linhas pra cima e pra baixo (Shift+Alt+j e Shift+Alt+k)
nnoremap <S-A-j> :m .+1<CR>==
nnoremap <S-A-k> :m .-2<CR>==
inoremap <S-A-j> <Esc>:m .+1<CR>==gi
inoremap <S-A-k> <Esc>:m .-2<CR>==gi
vnoremap <S-A-j> :m '>+1<CR>gv=gv
vnoremap <S-A-k> :m '<-2<CR>gv=gv

" OBS ------------------------------------------------------------------------

" Não permitir Ctrl + Shift + Alt + E nem Ctrl + Shift + Alt + P, pois esses 
" atalhos são usados no OBS para iniciar/finalizar e pausar uma gravação
" O uso do <Nop> é para remover atalhos internos do Vim
nnoremap <c-s-m-p> <Nop>
nnoremap <c-s-m-e> <Nop>

" Não permitir o uso dos atalhos Alt + 1, Alt + 2 e Alt + 3, pois é usado para
" a troca de cenas no OBS
nnoremap <m-0> <Nop>
nnoremap <m-1> <Nop>
nnoremap <m-2> <Nop>
nnoremap <m-3> <Nop>

" Nerd tree configs
nnoremap nf :NERDTreeFocus<CR>
nnoremap nt :NERDTree<CR>
nnoremap ng :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Backups --------------------------------------------------------------------

" Inicia o backup
set backup

" Define o diretório para os backups
set backupdir=~/.config/nvim/backups

" Arquivos do qual backups devem ser ignorados
set backupskip=/tmp/*

" Salva o arquivo no backup
set writebackup

" Ajuste para hot reloading (desabilitar o 'safe write')
set backupcopy=yes

" Muda diretório automaticamente
set autochdir

" Correção de typos ----------------------------------------------------------

nmap <F2> <Plug>(coc-rename)

iabbrev lenght length
iabbrev widht width
iabbrev heigth height

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

hi CocMenuSel ctermbg=green ctermfg=black guibg=#87afff
hi Pmenu ctermfg=green ctermbg=black
hi Comment ctermfg=green guifg=green

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

nnoremap <leader>i :Prettier <CR>

nmap <leader>c <Plug>(coc-codeaction-selected)<cr>

nnoremap ,n :call CocAction('diagnosticNext')<CR>
nnoremap ,p :call CocAction('diagnosticPrevious')<CR>

let g:yowish = {}
let g:yowish.nerdtree = 1
let g:yowish.comment_italic = 1

colorscheme yowish
