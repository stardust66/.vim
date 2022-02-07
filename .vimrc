set encoding=utf-8

" Display the absolute line number of current line
set number
set relativenumber

" filetype plugin
filetype plugin indent on
syntax enable

" Indent
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set nosmartindent

" Horizontal Scrolling
set nowrap
nnoremap <S-ScrollWheelUp> <ScrollWheelLeft>
nnoremap <S-ScrollWheelDown> <ScrollWheelRight>

" Make vim create hidden buffers by default
set hidden

set showcmd " Show command
set showmode " Show mode

" Remember 700 lines of history
set history=700

" Show current position
set ruler

" Default to 80 character guides
set colorcolumn=80

" Enable mouse
set mouse=a

" Set Unix as the default filetype
set ffs=unix,mac,dos

" Leader Key
let mapleader = ","

" Search
set incsearch
set hlsearch
set showmatch
set ignorecase
nnoremap <leader><space> :noh<cr>

" Folding
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" Backspace behaves normally
set backspace=indent,eol,start

" Toggle Line number type
function! NumberToggle()
    if (&relativenumber == 1)
        set norelativenumber
        set number
    else
        set nonumber
        set relativenumber
    endif
endfunc

nnoremap <leader>n :call NumberToggle()<CR>

" Configuration for Plugin Golden View
let g:goldenview__enable_at_startup = 0
nnoremap <C-L> Split

" Toggle background
function! BackgroundToggle()
    if (&background == "dark")
        set background=light
    else
        set background=dark
    endif
endfunc

nnoremap <leader>b :call BackgroundToggle()<CR>

" Set background automatically based on time
let time = system("date +%H")
if time > 16 || time < 6
    set background=dark
else
    set background=light
endif

" Colorscheme
colorscheme vim-material

" Add new line without entering insert mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" CtrlP
noremap <leader>p :CtrlP<CR>
let g:ctrlp_custom_ignore = 'node_modules\|git\|vendor\|tmp'

" Make statusline appear all the time
set laststatus=2

" Airline
let g:airline_theme = "material"

" Toggle show invisibles
nnoremap <leader>i :set list!<CR>

" Show trailing spaces and tabs
set listchars=""
set listchars=tab:→\ 
set listchars+=trail:·
set list

function StripWhiteSpace()
  %s/\s\+$//e
endfunction

" Global ycm_extra_conf
let g:ycm_global_ycm_extra_conf = $HOME."/.global_ycm_extra_conf.py"

let g:ycm_language_server = [
  \   {
  \     'name': 'haskell-language-server',
  \     'cmdline': [ 'haskell-language-server-wrapper', '--lsp' ],
  \     'filetypes': [ 'haskell', 'lhaskell' ],
  \     'project_root_files': [ 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml' ],
  \   },
  \   {
  \     'name': 'ocaml-language-server',
  \     'cmdline': [ 'ocamllsp' ],
  \     'filetypes': [ 'ocaml' ],
  \     'project_root_files': [ 'dune-project' ],
  \   },
  \ ]

let g:ycm_always_populate_location_list = 1

" Merlin (for Ocaml)
set rtp+=/home/jason/.opam/default/share/merlin/vim

" Enable syntax highlighting for flow
let g:javascript_plugin_flow = 1

let g:ycm_autoclose_preview_window_after_insertion = 1

let g:neoformat_enabled_haskell = ['brittany']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']

let g:opambin = substitute(system('opam config var bin'),'\n$','','''')
let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': g:opambin . '/ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']

" Coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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

" Turn off latex expansion from vim-julia
let g:latex_to_unicode_tab = "off"
