setlocal softtabstop=4
setlocal shiftwidth=4
setlocal smartindent
setlocal colorcolumn=80
setlocal commentstring=--\ %s
autocmd! BufWritePost <buffer> call StripWhiteSpace()
