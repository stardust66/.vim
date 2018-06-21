" Display the absolute line number of current line
set number
set relativenumber
" filetype plugin
filetype plugin on
filetype indent on

" Disable smart indent
set nosmartindent

" Default 2 spaces indent
set softtabstop=2
set expandtab
set shiftwidth=2

" Make vim create hidden buffers by default
set hidden

set showcmd " Show command
set showmode " Show mode

" Remember 700 lines of history
set history=700

" Syntax Highlighting
syntax enable

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

" Folding Settings
set foldmethod=indent
set foldlevelstart=10
set foldnestmax=10

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Backspace behaves normally
set backspace=2

" Pathogen
execute pathogen#infect()
call pathogen#helptags()

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

set guifont=Monaco:h13

" Colorscheme
set background=dark
colorscheme material-theme

" Add new line without entering insert mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" CtrlP
noremap <leader>p :CtrlP<CR>

" Map keys to :NERDTreeToggle
noremap tt :NERDTreeToggle<CR>

" Make statusline appear all the time
set laststatus=2

" Airline
let g:airline_theme = "spring_night"

" Toggle show invisibles
nnoremap <leader>i :set list!<CR>

" Show trailing spaces and tabs
set listchars=""
set listchars=tab:→\ 
set listchars+=trail:·

set list

" Remove trailing whitespace on save
autocmd FileType c,cpp,java,php,python,javascript autocmd BufWritePre <buffer> %s/\s\+$//e

" Enable Emmet for HTML, CSS, and javascript
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript EmmetInstall
