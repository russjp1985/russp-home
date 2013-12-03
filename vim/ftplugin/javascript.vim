source ~/.vim/php-doc.vim
inoremap <C-+> <ESC>:call PhpDocSingle()<CR>
nnoremap <C-=> :call PhpDocSingle()<CR>
vnoremap <C-=> :call PhpDocRange()<CR>
