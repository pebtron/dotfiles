" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Paul Barton <paul@moonkhan.org>
" Last Change:	2001 Oct 07

hi clear
set background=dark
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "moonkhan"

hi Comment    ctermfg=DarkBlue guifg=#80a0ff
hi Constant   ctermfg=DarkGray guifg=#ffa0a0
hi Special    ctermfg=LightGray guifg=Orange
hi Function   ctermfg=DarkCyan guifg=Orange
hi Identifier ctermfg=DarkGreen guifg=#40ffff
hi Statement  ctermfg=white guifg=#ffff60
hi PreProc    ctermfg=DarkGray guifg=#ff80ff
hi Type       ctermfg=white guifg=#60ff60
hi Ignore     ctermfg=black guifg=bg

"hi Normal		ctermbg=Black  ctermfg=LightGray  guibg=Black		 guifg=lightgreen
"hi Comment		term=bold	   ctermfg=DarkBlue guifg=Orange
"hi Constant		term=underline ctermfg=DarkGreen  guifg=White	gui=NONE
"" special line here
"hi Function     term=underline ctermfg=LightGray  guifg=Orange
"hi Identifier	term=underline ctermfg=DarkGreen  guifg=#00ffff
"hi Ignore					   ctermfg=black	  guifg=bg
"hi PreProc		term=underline ctermfg=LightGray  guifg=Wheat
"hi Search		term=reverse					  guifg=white	guibg=Blue
"hi Special		term=bold	   ctermfg=LightGray  guifg=magenta
"hi Statement	term=bold	   ctermfg=LightGray  guifg=#ffff00 gui=NONE
"hi Type						   ctermfg=LightGray  guifg=grey	gui=none
"hi Error		term=reverse   ctermbg=Red   ctermfg=White guibg=Red  guifg=White
"hi Todo			term=standout  ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
"" From the source:
"hi Cursor										  guifg=Orchid	guibg=fg
"hi Directory	term=bold	   ctermfg=LightCyan  guifg=Cyan
"hi ErrorMsg		term=standout  ctermbg=DarkRed	  ctermfg=White guibg=Red guifg=White
"hi IncSearch	term=reverse   cterm=reverse	  gui=reverse
"hi LineNr		term=underline ctermfg=Yellow					guifg=Yellow
"hi ModeMsg		term=bold	   cterm=bold		  gui=bold
"hi MoreMsg		term=bold	   ctermfg=LightGreen gui=bold		guifg=SeaGreen
"hi NonText		term=bold	   ctermfg=Blue		  gui=bold		guifg=Blue
"hi Question		term=standout  ctermfg=LightGreen gui=bold		guifg=Cyan
"hi SpecialKey	term=bold	   ctermfg=LightBlue  guifg=Cyan
"hi StatusLine	term=reverse,bold cterm=reverse   gui=NONE		guifg=White guibg=darkblue
"hi StatusLineNC term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=#333333
"hi Title		term=bold	   ctermfg=LightMagenta gui=bold	guifg=Pink
"hi WarningMsg	term=standout  ctermfg=LightRed   guifg=Red
"hi Visual		term=reverse   cterm=reverse	  gui=NONE		guifg=white guibg=darkgreen
