  set tabstop=4
  set shiftwidth=4
  set expandtab
  syntax on
  set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
  set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
  \ [%l/%L\ (%p%%)
  filetype plugin indent on
  au FileType py set autoindent
  au FileType py set smartindent
  au FileType py set textwidth=79 " PEP-8 Friendly
  cabbr <expr> %% expand('%:p:h')
