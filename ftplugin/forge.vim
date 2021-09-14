setlocal colorcolumn=80
setlocal commentstring=--\ %s
autocmd! BufWritePost <buffer> call StripWhiteSpace()
