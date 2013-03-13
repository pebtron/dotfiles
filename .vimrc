" Vim settings, a work in progress since 1999

call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on

set modelines=5

" Tab settings
" http://vimcasts.org/episodes/tabs-and-spaces/
set ts=4 sts=4 sw=4 et
nmap <leader>e :set expandtab!<CR>:set expandtab?<CR>

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults (much better!)
set backspace=2		" allow backspacing over everything in insert mode
" Now we set some defaults for the editor
set noautoindent		" always set autoindenting on
set nocindent       " c indent
set nosmartindent       " smart indent
set textwidth=72		" Don't wrap words by default
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set wildmenu " thanks dhathorn

set foldmethod=marker
"set noshelltemp

set hlsearch
set showcmd
set nojoinspaces
set nobackup
set noswapfile

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
"if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
"  set t_Co=16
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"endif

" Help with 256 colors
if &term =~ "screen"
  set t_Co=256
endif

if has("syntax")
  syntax on
endif

" The following are commented out as they cause vim to behave a lot
" different from regular vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make

" personal settings
"let g:molokai_original=1
colorscheme molokai
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized
"set background=dark
"colorscheme jellybeans

" Select a different colorscheme when in Mutt
autocmd FileType mail colorscheme jellybeans

" abbr's
iab alos        also
iab bianry      binary
iab charcter    character
iab charcters   characters
iab chciago     chicago
iab ehco        echo
iab goign       going
iab salien      saline
iab seperate    separate
iab shoudl      should
iab suprise     surprise
iab tpyo        typo
iab woudl       would
iab yoru        your
iab EAUP        EAUP http://webspace.uchicago.edu/publicserver/
"cab SFTP        r ~/Mail/uchicago/00sftp.txt
"cab NOSFTP      r ~/Mail/uchicago/00reasons.txt

" svn blame, source: http://tammersaleh.com/posts/quick-vim-svn-blame-snippet
vmap gl :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Reload .vimrc
nmap ,s :source ~/.vimrc
nmap ,v :e ~/.vimrc

" Toggle list
nmap <leader>l :set list!<CR>:set list?<CR>
set listchars=tab:>-,trail:-

" Toggle paste
map <leader>p :set paste!<CR>:set paste?<CR>

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

" tablify.pl macro
map ,t !ap~/webadmin/tools/bin/tablify.pl<CR>

" SVN diff mapping
map <Leader>9 :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg

"setlocal spell spelllang=en_us

" Useful during LDIF file manipulations
let @p='"aPjjddjjjjddkkkkPjjjj'

" http://vimcasts.org/episodes/tabs-and-spaces/
function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon ' shiftwidth='.&l:sw
    echon ' softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction
nmap <leader>t :call SummarizeTabs()<CR>

" http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <leader>s :call <SID>StripTrailingWhitespaces()<CR>
