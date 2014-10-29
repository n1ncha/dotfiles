if &term =~ "xterm-debian" || &term =~ "xterm-xfree86" || &term =~ "urxvt" || &term =~ "uxterm" || &term =~ "xterm" 
  set t_Co=256
"  set t_Sf=ESC[3%dm
"  set t_Sb=ESC[4%dm
  set ttyfast
endif
set nocompatible
set backspace=indent,eol,start
set history=1000
set viminfo='1000,f1,\"500,h
set ruler
set guioptions=acM
"set mouse=a
set backspace=indent,eol,start whichwrap+=<,>,[,]
colorscheme distinguished
syntax enable
set si
set ai
set bg=dark
set softtabstop=4 
set shiftwidth=4
set tabstop=4
set smarttab
let c_comment_strings = 1
set backup            " keep a backup file
set hlsearch
set incsearch
"set foldenable
"set foldmethod=syntax
set noshowmatch
set nofsync
set pastetoggle=<F11>
set noruler
set scrolloff=5
set swapsync=
set number
let cscflag = ""
set statusline=%<%F+0x%O\ %(%h%m%r%)%{cscflag}%=0x%B\ %l,%c%V\ %P
set laststatus=2
"set list
"set listchars=tab:  ,trail: ,extends:>,precedes:<
set showcmd
set noeol
set et
set popt=paper:letter,number:y
set termencoding=utf-8
set wildmenu
set clipboard=unnamed

" [global] |'esckeys'| allows cursor keys within insert mode only on SunOS
if has("unix") && system('uname')=='SunOS'
    set ek
endif



if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal g'\"" |
  \ endif
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE: 
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE: 
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if 0 "has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out.in")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd -c 24 -g 4
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif                            
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END

augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

if (has('cscope') && has('modify_fname') && !exists("loaded_autoload_cscope"))
	" Vim global plugin for autoloading cscope databases.
	" Last Change: Mon Jan 28 11:59:05 CST 2002
	" Maintainer: Michael Conrad Tilsra <tadpol@tadpol.org>
	" Revision: 0.3

	if exists("loaded_autoload_cscope")
		finish
	endif
	let loaded_autoload_cscope = 1
	let cscflag = " "

	" requirements, you must have these enables or this is useless.
	if(  !has('cscope') || !has('modify_fname') )
	  finish
	endif

	let s:save_cpo = &cpo
	set cpo&vim

	" If you set this to anything other than 1, the menu and macros will not be
	" loaded.  Useful if you have your own that you like.  Or don't want my stuff
	" clashing with any macros you've made.
	if !exists("g:autocscope_menus")
	  let g:autocscope_menus = 1
	endif

	"==
	" windowdir
	"  Gets the directory for the file in the current window
	"  Or the current working dir if there isn't one for the window.
	function s:windowdir()
	  if winbufnr(0) == -1
		return getcwd()
	  endif
	  return fnamemodify(bufname(winbufnr(0)), ':p:h')
	endfunc
	"
	"==
	" Find_in_parent
	" find the file argument and returns the path to it.
	" Starting with the current working dir, it walks up the parent folders
	" until it finds the file, or it hits the stop dir.
	" If it doesn't find it, it returns "Nothing"
	function s:Find_in_parent(fln,flsrt,flstp)
	  let here = a:flsrt
	  while ( strlen( here) > 0 )
		if filereadable( here . "/" . a:fln )
		  return here
		endif
		let fr = match(here, "/[^/]*$")
		if fr == -1
		  break
		endif
		let here = strpart(here, 0, fr)
		if here == a:flstp
		  break
		endif
	  endwhile
	  return "Nothing"
	endfunc
	"
	"==
	" Cycle_macros_menus
	"  if there are cscope connections, activate that stuff.
	"  Else toss it out.
	"  TODO Maybe I should move this into a seperate plugin?
	let s:menus_loaded = 0
	function s:Cycle_macros_menus()
	  if g:autocscope_menus != 1
		return
	  endif
	  if cscope_connection()
		if s:menus_loaded == 1
		  return
		endif
		let s:menus_loaded = 1
		set csto=0
		set cst
		silent! map <unique> <C-\>s :cs find c <C-R>=expand("<cword>")<CR><CR>
		silent! map <unique> <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
		silent! map <unique> <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
		silent! map <unique> <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
		silent! map <unique> <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
		silent! map <unique> <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
		silent! map <unique> <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
		silent! map <unique> <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
		if has("menu")
		  nmenu &Cscope.Find.Symbol<Tab><c-\>s
			\ :cs find s <C-R>=expand("<cword>")<CR><CR>
		  nmenu &Cscope.Find.Definition<Tab><c-\>g
			\ :cs find g <C-R>=expand("<cword>")<CR><CR>
		  nmenu &Cscope.Find.Called<Tab><c-\>d
			\ :cs find d <C-R>=expand("<cword>")<CR><CR>
		  nmenu &Cscope.Find.Calling<Tab><c-\>c
			\ :cs find c <C-R>=expand("<cword>")<CR><CR>
		  nmenu &Cscope.Find.Assignment<Tab><c-\>t
			\ :cs find t <C-R>=expand("<cword>")<CR><CR>
		  nmenu &Cscope.Find.Egrep<Tab><c-\>e
			\ :cs find e <C-R>=expand("<cword>")<CR><CR>
		  nmenu &Cscope.Find.File<Tab><c-\>f
			\ :cs find f <C-R>=expand("<cword>")<CR><CR>
		  nmenu &Cscope.Find.Including<Tab><c-\>i
			\ :cs find i <C-R>=expand("<cword>")<CR><CR>
	"      nmenu &Cscope.Add :cs add 
	"      nmenu &Cscope.Remove  :cs kill 
		  nmenu &Cscope.Reset :cs reset<cr>
		  nmenu &Cscope.Show :cs show<cr>
		  " Need to figure out how to do the add/remove. May end up writing
		  " some container functions.  Or tossing them out, since this is supposed
		  " to all be automatic.
		endif
	  else
		let s:menus_loaded = 0
		set nocst
		silent! unmap <C-\>s
		silent! unmap <C-\>g
		silent! unmap <C-\>d
		silent! unmap <C-\>c
		silent! unmap <C-\>t
		silent! unmap <C-\>e
		silent! unmap <C-\>f
		silent! unmap <C-\>i
		if has("menu")  " would rather see if the menu exists, then remove...
		  silent! nunmenu Cscope
		endif
	  endif
	endfunc
	"
	"==
	" Unload_csdb
	"  drop cscope connections.
	function s:Unload_csdb()
	  if exists("b:csdbpath")
		if cscope_connection(3, "out", b:csdbpath)
		  let save_csvb = &csverb
		  set nocsverb
		  exe "cs kill " . b:csdbpath
		  set csverb
		  let &csverb = save_csvb
		endif
	  endif
	endfunc
	"
	"==
	" Cycle_csdb
	"  cycle the loaded csccope db.
	function s:Cycle_csdb()
		if exists("b:csdbpath")
		  if cscope_connection(3, "out", b:csdbpath)
			return
			"it is already loaded. don't try to reload it.
		  endif
		endif
		let newcsdbpath = s:Find_in_parent("cscope.out",s:windowdir(),$HOME)
"		echo "Found cscope.out at: " . newcsdbpath
	"    echo "Windowdir: " . s:windowdir()
		let g:cscflag = "[CSCOPE]"
		if newcsdbpath != "Nothing"
		  let b:csdbpath = newcsdbpath
		  if !cscope_connection(3, "out", b:csdbpath)
			let save_csvb = &csverb
			set nocsverb
			exe "cs add " . b:csdbpath . "/cscope.out " . b:csdbpath
			set csverb
			let &csverb = save_csvb
		  endif
		  "
		else " No cscope database, undo things. (someone rm-ed it or somesuch)
		  call s:Unload_csdb()
		endif
	endfunc

	" auto toggle the menu
	augroup autoload_cscope
	 au!
	 au BufEnter *.[chly]  call <SID>Cycle_csdb() | call <SID>Cycle_macros_menus()
	 au BufEnter *.cc      call <SID>Cycle_csdb() | call <SID>Cycle_macros_menus()
	 au BufUnload *.[chly] call <SID>Unload_csdb() | call <SID>Cycle_macros_menus()
	 au BufUnload *.cc     call <SID>Unload_csdb() | call <SID>Cycle_macros_menus()
	augroup END

	let &cpo = s:save_cpo
endif
au BufNewFile,BufRead *.tac set filetype=python

nnoremap : ;
nnoremap ; :
autocmd BufEnter * silent! lcd %:p:h
