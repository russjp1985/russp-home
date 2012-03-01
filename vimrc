call pathogen#infect()

syntax on
set ruler
set noerrorbells
set number
set ignorecase
set visualbell

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set mouse=a

" set foldmethod=syntax
" set foldlevel=100
set list listchars=tab:»·,trail:·

autocmd BufWritePre * :%s/\s\+$//e

 au BufRead,BufNewFile *.ctp       set filetype=php
 au BufRead,BufNewFile *.htm       set filetype=php
 au BufRead,BufNewFile *.html      set filetype=php
 au BufRead,BufNewFile *.j         set filetype=objj
 au BufRead,BufNewFile *.jade      set filetype=jade
 au BufRead,BufNewFile *.js        set filetype=javascript
 au BufRead,BufNewFile *.json      set filetype=javascript
 au BufRead,BufNewFile *.mako      set filetype=mako
 au BufRead,BufNewFile *.pp        set filetype=puppet
 au BufRead,BufNewFile *.py        set filetype=python
 au BufRead,BufNewFile *.t         set filetype=perl
 au BufRead,BufNewFile *.thtml     set filetype=php
 au BufRead,BufNewFile *nginx*     set filetype=nginx
 au BufRead,BufNewFile Vagrantfile set filetype=ruby

" Puppet syntax: use 2-tabs
autocmd FileType puppet setlocal shiftwidth=2 tabstop=2

filetype plugin on
filetype indent on
autocmd FileType python set textwidth=79

au BufEnter * if &filetype == "python" | match ErrorMsg '\%>79v.\+' | endif

vnoremap < <gv
vnoremap > >gv
nmap     <C-K> :set invpaste<CR>
nmap     <C-N> :set invnumber<CR>


""" PHP
" Doc functions
source ~/.vim/php-doc.vim
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>

""" Position

" Tell vim to remember certain things when we exit
"  '10 : marks will be remembered for up to 10 previously edited files
"  "100 : will save up to 100 lines for each register
"  :20 : up to 20 lines of command-line history will be remembered
"  % : saves and restores the buffer list
"  n... : where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

" when we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost *
                \ if expand("<afile>:p:h") !=? $TEMP |
                \ if line("'\"") > 1 && line("'\"") <= line("$") |
                \ let JumpCursorOnEdit_foo = line("'\"") |
                \ let b:doopenfold = 1 |
                \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
                \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
                \ let b:doopenfold = 2 |
                \ endif |
                \ exe JumpCursorOnEdit_foo |
                \ endif |
                \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
                \ if exists("b:doopenfold") |
                \ exe "normal zv" |
                \ if(b:doopenfold > 1) |
                \ exe "+".1 |
                \ endif |
                \ unlet b:doopenfold |
                \ endif
augroup END

colorscheme russp
