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

" Make vim create hidden buffers by default
set hidden

set showcmd " Show command
set showmode " Show mode

" Remember 700 lines of history
set history=700

" Show current position
set ruler

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
if time > 18 || time < 6
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

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<S-f>"
let g:UltiSnipsJumpBackwardTrigger="<S-b>"

" Merlin (for Ocaml)
set rtp+=/home/jason/.opam/default/share/merlin/vim
