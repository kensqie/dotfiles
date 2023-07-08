" General
let mapleader="\<space>"
set nobackup
set noswapfile
set nocursorline
set noexpandtab
set nohlsearch
set ignorecase
set incsearch
set smartcase
set pumheight=10
set shiftwidth=4
set tabstop=4
set smarttab
set list
set listchars=eol:↲,tab:→\ ,space:·,lead:·,trail:∙,nbsp:␣,extends:<,precedes:>

" Open netrw
nnoremap <silent> <leader>e :Explore<CR>

" Toggle wrap
nnoremap <silent> <leader>z :set wrap!<CR>

" Toggle list
nnoremap <silent> <leader>l :set list!<CR>
