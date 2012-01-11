setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

map <C-C> :CoffeeCompile<cr><C-W><C-W>
map cm <esc>:!coffee %<cr>
match ErrorMsg '\%>79v.\+'
