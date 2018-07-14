""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
try
	lang en_US
catch
endtry

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

let mapleader=","

set tags=.git/tags,tags;

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clear highlight
nnoremap <c-l> :noh<cr><c-l>

" FZF
nnoremap <c-p> :FZF<cr>

" Ag
nnoremap \ :Ag<cr>

" Fugitive
nnoremap <leader>gd :Gvdiff<cr>]c
nnoremap <leader>gs :Gstatus<cr>

" Buffer search with FZF
nnoremap <leader>b :Buffers<cr>

" Moving lines
nnoremap <silent> <c-k> :move-2<cr>
nnoremap <silent> <c-j> :move+<cr>
xnoremap <silent> <c-k> :move-2<cr>gv
xnoremap <silent> <c-j> :move'>+<cr>gv

" Traversing buffers
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" Traversing quickfix
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Functions & Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space
command! Chomp %s/\s\+$// | normal! ``

" Multipurpose tab key
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

autocmd BufWritePre * call mkdir(expand('%:p:h'), 'p')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
silent! if plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'waldyr/vim-localorie'

Plug 'chriskempson/vim-tomorrow-theme'

call plug#end()
endif

nnoremap <silent> <leader>lt :call localorie#translate()<cr>
nnoremap <silent> <leader>le :call localorie#expand_key()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colo tomorrow-night " colorscheme

set so=10 " Set 7 lines to the cursor - when moving vertical..

set wildmenu " Turn on WiLd menu

set ruler " Always show current position

set cmdheight=2 " The commandbar height

set hidden " Change buffer - without saving

set backspace=eol,start,indent " Set backspace config

set whichwrap+=<,>,h,l " Traverse endline to next line

set hlsearch " Search highlight

set incsearch " Make search act like search in modern browsers

set nolazyredraw " Don't redraw while executing macros

set showmatch " Show matching bracets when text indicator is over them

set number " Show me the numbers

set ignorecase

set smartcase

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
set nobackup
set nowb
set noswapfile

" Fold related
set foldmethod=manual
set nofoldenable
set nojoinspaces

" Tab related
set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

set lbr
set tw=500

set autoindent
set smartindent
set wrap
