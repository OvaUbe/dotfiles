runtime! before/*.vim

function! s:cr_for_popup()
    return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

set wm=0
set tw=0
set nowrap

set clipboard+=unnamed

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

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/a.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-abolish'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'jlfwong/vim-mercenary'
Plug 'kana/vim-operator-user'
Plug 'lyuts/vim-rtags'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'w0rp/ale'
Plug 'terryma/vim-smooth-scroll'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'kkoomen/vim-doge'
Plug 'cespare/vim-toml'

call plug#end()

filetype plugin indent off
