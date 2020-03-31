" Enable spell check
setlocal spell
setlocal complete+=kspell

" vimtex autocomplete with YouCompleteMe
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" Hard wrap text
setlocal colorcolumn=80
setlocal textwidth=80
