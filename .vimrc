set nu
syntax enable
set shiftwidth=4
set expandtab
set tabstop=4
set mouse=a
set hlsearch
set incsearch
set autoindent

" KO
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:-
nnoremap <C-l> :set list!<CR>:set number!<CR> 
nnoremap <C-h> :noh<CR>
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun
call SetupCommandAlias("w!!","w !sudo tee %")
