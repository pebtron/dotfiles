" $Id$
" Configuration file for gvim
" Written for Debian GNU/Linux by W.Akkerman <wakkerma@debian.org>
" Some modifications by J.H.M. Dassen <jdassen@wi.LeidenUniv.nl>
"let myfiletypefile = "~/vim/myfiletypes.vim"
"let $VIMRUNTIME="/home/pbarton/vim/vim57/"
"let $VIMRUNTIME="/home/bartonp/vim/vim57/"

set modelines=5 " Override Debian's /etc/vim/vimrc setting of 0

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults (much better!)
set backspace=2		" allow backspacing over everything in insert mode
" Now we set some defaults for the editor 
set noautoindent		" always set autoindenting on
set nocindent       " c indent
set nosmartindent       " smart indent
set textwidth=72		" Don't wrap words by default
"set textwidth=76
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Filetypes
augroup filetype
        au!
        au! BufRead,BufNewFile *.php    set filetype=php
        au! BufRead,BufNewFile *.php    set formatoptions=acroq
        au! BufRead,BufNewFile *.inc    set filetype=php
        au! BufRead,BufNewFile *.inc    set formatoptions=acroq
        au! BufRead,BufNewFile *.html   set filetype=php
        au! BufRead,BufNewFile *.html   set formatoptions=acroq
        au! BufRead,BufNewFile *.htm    set filetype=php
        au! BufRead,BufNewFile *.obj    set filetype=php
        au! BufRead,BufNewFile *.phtml  set filetype=php
        au! BufRead,BufNewFile *.phps   set filetype=php
        au! BufRead,BufNewFile *.dec    set filetype=deck
        au! BufRead,BufNewFile *.dlist  set filetype=deck
augroup END

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Vim5 comes with syntaxhighlighting. If you want to enable syntaxhightlighting
" by default uncomment the next three lines. 
if has("syntax")
  syntax on  " Default to no syntax highlightning 
endif

set background=dark
"" Here come my colors...
"if &background == "dark"
"  hi Comment    ctermfg=DarkBlue
"  hi Constant   ctermfg=DarkGreen
"  hi Special    ctermfg=LightGrey
"  hi Function   ctermfg=LightGrey
"  hi Identifier ctermfg=DarkGreen
"  hi Statement  ctermfg=LightGrey
"  hi PreProc    ctermfg=LightGrey
"  hi Type       ctermfg=LightGrey
"  hi Ignore     ctermfg=Black
"else
"  hi Comment    ctermfg=DarkBlue
"  hi Constant   ctermfg=DarkGreen
"  hi Special    ctermfg=LightGrey
"  hi Function   ctermfg=LightGrey
"  hi Identifier ctermfg=DarkGreen
"  hi Statement  ctermfg=LightGrey
"  hi PreProc    ctermfg=LightGrey
"  hi Type       ctermfg=LightGrey
"  hi Ignore     ctermfg=Black
"endif
"hi Error term=reverse ctermbg=Red ctermfg=White
"hi Todo  term=standout ctermbg=Yellow ctermfg=Black

" Use Vim 6.0 custom color file
"let g:colors_name = "moonkhan"
"colorscheme moonkhan cool darkdot manxome navajo-night
colorscheme darkdot

" Debian uses compressed helpfiles. We must inform vim that the main
" helpfiles is compressed. Other helpfiles are stated in the tags-file.
"set helpfile=$VIMRUNTIME/doc/help.txt.gz

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make

" personal settings
set background=dark
set expandtab
set shiftwidth=4
set tabstop=4

" abbr's
iab alos		also
iab bianry	binary
iab charcter	character
iab charcters 	characters
iab exmaple		example
iab exmaples	examples
iab shoudl		should
iab seperate	separate
iab tpyo		typo
iab suprise		surprise
iab ehco		echo
iab salien      saline
iab chciago     chicago

ab ADDR			paul@moonkhan.org
ab WWW			www.moonkhan.org
ab EAUP         EAUP http://www.uchicago.edu/publicserver/

ab #b /********************************************************
ab #e ********************************************************/

" wrap <td> around VISUALLY selected text
vmap std "zdi<td><C-R>z</td><ESC>

" Reload .vimrc
nmap ,s :source ~/.vimrc
nmap ,v :e ~/.vimrc

" Fix :set list
set listchars=tab:>-,trail:-

" Fix Vim paste bug
map <F10> :set paste<CR>
map <F11> :set nopaste<CR>
imap <F10> <C-O>:set paste<CR>
imap <F11> <nop>
set pastetoggle=<F11>

"filetype plugin indent off

" Tag Select/Wrapper 
" These mappings and TagSelection function will allow you to place " an XML tag around either the current word, or the current selected " text 
nmap <Leader>t viw<Leader>t
vnoremap <Leader>t <Esc>:call TagSelection()<CR>

function! TagSelection()
  let l:tag = input("Tag name? ")
  " exec "normal `>a</" . l:tag . ">\e"
  " Strip off all but the first work in the tag for the end tag
  exec "normal `>a</" .
    \ substitute( l:tag, '[ \t"]*\(\<\w*\>\).*', '\1>\e', "" )
  exec "normal `<i"
    \ substitute( l:tag, '[ \t"]*\(\<.*\)', '<\1>\e', "" )
endfunction

" Templating (indent-friendly)
:imap <buffer> ;fo <C-O>mzfor(%%%; %%%; %%%)<CR>{<CR>%%%<CR>}<CR><C-O>'z;;
:imap <buffer> ;; <C-O>/%%%<CR><C-O>c31
:nmap <buffer> ;; /%%%<CR>c31

" lhs comments
map ,# :s/^/#/<CR>
map ,/ :s/^/\/\//<CR>
map ,> :s/^/> /<CR>
map ," :s/^/\"/<CR>
map ,% :s/^/%/<CR>
map ,! :s/^/!/<CR>
map ,; :s/^/;/<CR>
map ,- :s/^/--/<CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR>:nohlsearch<CR>

" wrapping comments
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR>
map ,( :s/^\(.*\)$/\(\* \1 \*\)/<CR>
map ,< :s/^\(.*\)$/<!-- \1 -->/<CR>
map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR>:nohlsearch<CR> 

" EnhancedCommentify
source ~/.vim/plugin/EnhancedCommentify.vim
helptags ~/.vim/doc

" GPG support
"source ~/.vim/gpg.vim
source ~/.vim/gnupg.vim
