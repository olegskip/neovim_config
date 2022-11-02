lua require('plugins')

autocmd VimEnter * call timer_start(10, { tid -> execute('wincmd p')})
autocmd VimEnter * call timer_start(10, { tid -> execute('Copilot dislabe')})

set mouse=
