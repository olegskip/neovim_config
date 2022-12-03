lua require('plugins')

autocmd VimEnter * call timer_start(10, { tid -> execute('wincmd p')})

set mouse=a
