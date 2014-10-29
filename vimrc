set nocompatible
set encoding=utf-8
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'bling/vim-airline'
Bundle 'chrisbra/csv.vim'
Bundle 'edkolev/tmuxline.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'majutsushi/tagbar'
Bundle 'mkitt/tabline.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'tpope/vim-fugitive'

filetype plugin indent on

" Solarized colorscheme
set t_Co=256
syntax enable
set background=dark
colorscheme solarized

" Plugin configuration

let g:mustache_abbreviations = 1

" airline
set laststatus=2
"set ambiwidth=single
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" tagbar
nnoremap <F8> :TagbarToggle<CR>

" ctags
set tags=tags;/

" ctrlp settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" pymode
let g:pymode_options=1
let g:pymode_rope_completion=1
let g:pymode_rope_completion_on_dot=1
let g:pymode_rope_completion_bind='<C-Space>'
let g:pymode_rope_autoimport=1
let g:pymode_rope_autoimport_import_after_complete=1

let g:pymode_lint_checker="pyflakes"
let g:pymode_lint_onfly=0
let g:pymode_lint_hold=0
let g:pymode_lint_jump=0

let g:pymode_rope_lookup_project = 0

" Remaps
let mapleader=','

" easy cmd mode
nnoremap ; :
nnoremap : ;

" toggle relative/absolute line numbers
nnoremap <F10> :call NumberToggle()<CR>

" unhighlight my search
nnoremap <leader><space> :nohlsearch<CR>

" folds
nnoremap <space> za
nnoremap <leader>o zR

" saving/quitting
nnoremap <leader>w :w<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>q :q<CR>

" tabs
nnoremap <leader>h :bp<CR>
nnoremap <leader>l :bn<CR>
nnoremap <C-t> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>

" window nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" vim options
set lazyredraw
set cursorline
set hlsearch
set incsearch
set ignorecase
set showmatch
set mat=2
set smartcase
set history=10000
set ruler
set showcmd
"set textwidth=0
"let g:leave_my_textwidth_alone=1
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smarttab
set autoindent
set smartindent
set shiftround
set nowrap

set nobackup
set nowritebackup
set noswapfile

set hidden
set autoread

set relativenumber
set scrolloff=5
set viewoptions=cursor

" turn on the mouse
if has('mouse')
  set mouse=a
endif

" Toggle relative/absolute line numbering via Paul Rouget
function! NumberToggle()
    if(&relativenumber == 1)
        set number
    else
        set relativenumber
    endif
endfunc

" origin: unknown
autocmd BufEnter * :syntax sync fromstart

" Jump to location as of last file exit.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

"set viminfo='10,\"100,:20,%,n~/.viminfo
"set viminfo^=%

augroup JumpCursorOnEdit
    au!
    autocmd BufReadPost ?* silent
	 \ if expand("<afile>:p:h") !=? $TEMP |
	 \ if line("'\"") > 1 && line("'\"") <= line("$") |
	 \ let JumpCursorOnEdit_foo=line("'\"") |
	 \ let b:doopenfold=1 |
	 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
	 \ let JumpCursorOnEdit_foo=JumpCursorOnEdit_foo - 1 |
	 \ let b:doopenfold=2 |
	 \ endif |
	 \ exe JumpCursorOnEdit_foo |
	 \ endif |
	 \ endif
	 " Need to postpone using "zv" until after reading the modelines.
	 autocmd BufWinEnter ?* silent
	 \ if exists("b:doopenfold") |
	 \ exe "normal zv" |
	 \ if(b:doopenfold > 1) |
	 \ exe "+".1 |
	 \ endif |
	 \ unlet b:doopenfold |
	 \ endif
	augroup END

au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" Close QuickFix window when trying to exit
aug QFClose
    au!
    au WinEnter * silent if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

autocmd BufRead,BufNewFile	*.hbs setl sw=2 sts=2 et
