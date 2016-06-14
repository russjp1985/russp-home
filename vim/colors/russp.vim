
hi clear
if exists("syntax_on")
  syntax reset
endif

" hi Normal		ctermbg=Black  ctermfg=White guibg=Black		 guifg=Green
hi Comment		term=bold	   ctermfg=Blue   guifg=Orange
hi Constant		term=underline ctermfg=Red guifg=White	gui=NONE
hi Identifier	term=underline ctermfg=Cyan  guifg=#00ffff
hi Ignore					   ctermfg=black	  guifg=bg
hi PreProc		term=underline ctermfg=Magenta  guifg=Wheat
hi Search		term=reverse					  guifg=white	guibg=Blue
hi Special		term=bold	   ctermfg=Magenta  guifg=magenta
hi Statement	term=bold	   ctermfg=Yellow	  guifg=#ffff00 gui=NONE
hi Type						   ctermfg=Green guifg=grey	gui=none
hi Error		term=reverse   ctermbg=Red	  ctermfg=White guibg=Red  guifg=White
hi Todo			term=standout  ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
" From the source:
hi Cursor										  guifg=Orchid	guibg=fg
hi Directory	term=bold	   ctermfg=Cyan  guifg=Cyan
hi ErrorMsg		term=standout  ctermbg=DarkRed	  ctermfg=White guibg=Red guifg=White
hi IncSearch	term=reverse   cterm=reverse	  gui=reverse
hi LineNr		term=underline ctermfg=Yellow					guifg=Yellow
hi ModeMsg		term=bold	   cterm=bold		  gui=bold
hi MoreMsg		term=bold	   ctermfg=Green gui=bold		guifg=Green
hi NonText		term=bold	   ctermfg=Magenta		  gui=bold		guifg=Blue
hi Question		term=standout  ctermfg=Green gui=bold		guifg=Cyan
" hi SpecialKey	term=bold	   ctermfg=LightBlue  guifg=Cyan
hi StatusLine	term=reverse,bold cterm=reverse   gui=NONE		guifg=White guibg=darkblue
hi StatusLineNC term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=#333333
hi Title		term=bold	   ctermfg=Magenta gui=bold	guifg=Pink
hi WarningMsg	term=standout  ctermfg=LightRed   guifg=Red
hi Visual		term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=darkgreen
