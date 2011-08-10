
hi clear
if exists("syntax_on")
  syntax reset
endif

hi Normal		ctermbg=Black  ctermfg=White guibg=Black		 guifg=White    gui=none
hi Comment			   ctermfg=Blue   guifg=LightSkyBlue    gui=none
hi Constant		term=underline ctermfg=Red guifg=Red	gui=none
hi Identifier	term=underline ctermfg=LightCyan  guifg=LightCyan   gui=none
hi Ignore					   ctermfg=black	  guifg=bg  gui=none
hi PreProc		term=underline ctermfg=LightMagenta  guifg=LightMagenta gui=none
hi Search		term=reverse					  guifg=white	guibg=Blue  gui=none
hi Number		   ctermfg=LightMagenta  guifg=LightMagenta   gui=none
hi Special			   ctermfg=LightMagenta  guifg=LightMagenta gui=none
hi Statement		   ctermfg=Yellow	  guifg=Yellow gui=none
hi Type						   ctermfg=LightGreen guifg=LightGreen	gui=none
hi Error		term=reverse   ctermbg=Red	  ctermfg=White guibg=Red  guifg=White  gui=none
hi Todo			term=standout  ctermbg=Yellow ctermfg=Black guifg=Yellow guibg=Black    gui=none
" From the source:
hi Cursor										  guifg=Orchid	guibg=fg    gui=none
hi Directory		   ctermfg=LightCyan  guifg=LightCyan   gui=none
hi ErrorMsg		term=standout  ctermbg=DarkRed	  ctermfg=White guibg=DarkRed guifg=White   gui=none
hi IncSearch	term=reverse   cterm=reverse	  gui=reverse   gui=none
hi LineNr		term=underline ctermfg=Yellow					guifg=Yellow    gui=none
hi ModeMsg			   c		  gui=none
hi MoreMsg			   ctermfg=LightGreen gui=none		guifg=LightGreen
hi NonText			   ctermfg=LightMagenta		  gui=none		guifg=LightMagenta
hi Question		term=standout  ctermfg=LightGreen gui=none		guifg=LightGreen
hi SpecialKey		   ctermfg=LightBlue  guifg=LightBlue   gui=none
hi StatusLine	term=reverse,bold cterm=reverse   gui=none		guifg=White guibg=darkblue
hi StatusLineNC term=reverse   cterm=reverse	  gui=none		guifg=white guibg=#333333
hi Title			   ctermfg=LightMagenta gui=none guifg=LightMagenta
hi WarningMsg	term=standout  ctermfg=LightRed   guifg=LightRed   gui=none
hi Visual		term=reverse   cterm=reverse	  gui=none		guifg=white guibg=darkgreen

