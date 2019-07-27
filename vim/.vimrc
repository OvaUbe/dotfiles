runtime! before/*.vim

function! s:cr_for_popup()
    return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

set wm=0
set tw=0
set nowrap

set noswapfile
set nobackup
set nowritebackup

set showmatch
set hlsearch
set incsearch
set number
set mouse=a
set laststatus=2
set backspace=2

set foldmethod=syntax
set nofoldenable

set background=dark
colorscheme wombat256mod
call PrettyCursor()

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

set modeline
set modelines=5
set foldlevel=5

set exrc
set secure

set wildmenu
set wildmode=list:longest,full

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

set completeopt=menuone,noselect

let g:column_highlight = 0
let g:column_number_highlight = 120
nmap <C-B><C-B> :call ToggleColumnHighlight()<CR>
call ToggleColumnHighlight()

nnoremap j gj
nnoremap k gk
nnoremap <leader>w <C-w>
nnoremap <silent> <C-n> :nohl<CR>

vmap <C-c> "+y
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

nnoremap <C-r><C-r> :e %<CR>
nnoremap <C-r><C-r><C-r> :e! %<CR>

inoremap <expr><C-n> pumvisible() ? '<C-n>' : '<C-X><C-U>'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><CR> <C-r>=<SID>cr_for_popup()<CR>

call plug#begin('~/.vim/plugged')

Plug 'cespare/vim-toml'
Plug 'davidhalter/jedi-vim'
Plug 'easymotion/vim-easymotion'
Plug 'jlfwong/vim-mercenary'
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-operator-user'
Plug 'kkoomen/vim-doge'
Plug 'mileszs/ack.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdtree'
Plug 'shougo/neocomplete.vim'
Plug 'terryma/vim-smooth-scroll'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/a.vim'
Plug 'w0rp/ale'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

call plug#end()

filetype plugin indent off
