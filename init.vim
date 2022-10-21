lua require('plugins')

" autocmd VimEnter * NvimTreeOpen

autocmd VimEnter * call timer_start(10, { tid -> execute('wincmd p')})
" autocmd VimEnter * call timer_start(1, { tid -> execute('colorscheme codedark')})

set mouse=
" :nunmap <buffer> <Up> 
" :nunmap <buffer> <Down> 
