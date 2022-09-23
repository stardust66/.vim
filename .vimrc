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

" Faster updatetime for gitgutter, coc.nvim, etc.
set updatetime=300

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
" let time = system("date +%H")
" if time > 16 || time < 6
"     set background=dark
" else
"     set background=light
" endif
set background=dark

" Colorscheme
colorscheme vim-material

" Add new line without entering insert mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" CtrlP
noremap <leader>p :CtrlP<CR>
let g:ctrlp_custom_ignore = {
  \ 'dir': 'node_modules\|git\|vendor\|tmp\|target',
  \ 'file': '\.o$'
  \ }

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

" Merlin (for Ocaml)
set rtp+=/home/jason/.opam/default/share/merlin/vim

" Enable syntax highlighting for flow
let g:javascript_plugin_flow = 1

let g:neoformat_enabled_haskell = ['ormolu']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_typescriptreact = ['prettier']
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_cpp = ['clangformat']

let g:opambin = substitute(system('opam config var bin'),'\n$','','''')
let g:neoformat_ocaml_ocamlformat = {
            \ 'exe': g:opambin . '/ocamlformat',
            \ 'no_append': 1,
            \ 'stdin': 1,
            \ 'args': ['--enable-outside-detected-project', '--name', '"%:p"', '-']
            \ }

let g:neoformat_enabled_ocaml = ['ocamlformat']

" Coc.nvim
source $HOME/.vim/config/coc-nvim.vim

" Turn off latex expansion from vim-julia
let g:latex_to_unicode_tab = "off"
