" PHPcs standards file
let Vimphpcs_Standard='/home/rposluszny/development/Web/tests/standards/stable-ruleset.xml'
" autocmd BufWritePost *.php silent! :CodeSniff

""" PHP
" Doc functions
source ~/.vim/php-doc.vim
inoremap <C-=> <ESC>:call PhpDocSingle()<CR>
nnoremap <C-=> :call PhpDocSingle()<CR>
vnoremap <C-=> :call PhpDocRange()<CR>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

