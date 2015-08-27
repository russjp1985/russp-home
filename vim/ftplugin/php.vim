" PHPcs standards file
let Vimphpcs_Standard='/home/rposluszny/development/Web/tests/standards/stable-ruleset.xml'
" autocmd BufWritePost *.php silent! :CodeSniff

""" PHP
" Doc functions
source ~/.vim/php-doc.vim

noremap <C-P> <ESC>:call PhpDocSingle()<CR>
inoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>
nnoremap <C-H> :Php <q-args>

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

