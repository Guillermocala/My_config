
":::instalacion de plugins:::

call plug#begin('~/AppData/Local/nvim/plugged') 	"directorio donde se van a instalar los plugins

"plugins
Plug 'joshdick/onedark.vim' 		"tema
Plug 'Yggdroot/indentLine' 		"indentacion
Plug 'mattn/emmet-vim' 			"emmet para diseño web
Plug 'vim-airline/vim-airline'		"diseño de la barra en la cual se muestran los modos, la linea, etc.
Plug 'vim-airline/vim-airline-themes'	"temas para el vim-airline
Plug 'preservim/nerdtree'		"gestor de archivos en forma de arbol.
Plug 'christoomey/vim-tmux-navigator'	"poder navegar entre archivos abiertos
Plug 'jiangmiao/auto-pairs'		"autocompletado de llaves, corchetes, etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}	"autocompletado inteligente
call plug#end() 			"cerramos el llamado de los plugins

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"CONFIGURACIONES BASICAS 
set number 				"muestra los numeros de cada linea en la parte izquierda 
set relativenumber 			"la distribucion de los numeros en lineas de manera relativa
set mouse=a 				"permite la interaccion con el mouse
set noshowmode				"me deja de mostrar el modo en el que estamos 'normal, insert, visual, etc'
syntax enable 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
set encoding=utf-8 			"permite setear la codificación de archivos para aceptar caracteres especiales
set sw=4 				"la indentación genera 4 espacios
set nowrap				"el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
set clipboard=unnamed			"para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.	

"CONFIGURACION DE MAPPING PARA REEMPLAZAR ESC
imap ii <Esc>
vmap ii <Esc>

"configuracion del tema
set termguicolors 			"activa el true color en la terminal
colorscheme onedark 			"activar el tema onedark

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

"configuracion de emmet-vim
let g:user_emmet_leader_key=',' 	"mapeando la tecla lider por una coma, con esto se completa los tag con doble coma.

"configuracion de vim-airline
let g:airline#extensions#tabline#enabled = 1	"muestra la linea de pestaña en la que estamos buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'	"muestra solo el nombre del archivo que estamos modificando
let g:airline_theme='murmur'	"el tema de airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


""""""""""""""
" CoC Config
""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
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

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" This is the fucking line that i was looking for zzz
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"



