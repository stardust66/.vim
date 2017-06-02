" Display the absolute line number of current line
set number
set relativenumber
" filetype plugin
filetype plugin on
filetype indent on

" Disable smart indent
set nosmartindent

" Default 4 spaces indent
set tabstop=4
set expandtab
set shiftwidth=4

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
colorscheme spring-night

" Add new line without entering insert mode
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

" CtrlP
noremap <leader>p :CtrlP<CR>

" Open NerdTree automatically when vim starts if
" no files were specified (from NerdTree's github
" page)
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Map keys to :NERDTreeToggle
noremap tt :NERDTreeToggle<CR>

" Make statusline appear all the time
set laststatus=2

" Airline
let g:airline_theme = "spring_night"

" Disable syntastic by default
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

" Toggle show invisibles
nnoremap <leader>i :set list!<CR>

" Reset
set listchars=""
set listchars=tab:→\ 
set listchars+=trail:·

" Disable Preview on Completion
set completeopt-=preview

" Shortcuts for YouCompleteMe
nnoremap gl :YcmCompleter GoToDeclaration<CR>
