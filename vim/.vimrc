runtime! archlinux.vim

set wm=0
set nu
set nowrap

" Tabs section
set tabstop=8 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab

" Show some invisible symbols
set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" New line tabs
set si

" C-style tabs
set cin

" Smart search
set incsearch

" Enable wildmenu
set wildmenu
set wildmode=list:longest,full

" Pleasant backspace
set backspace=2

" Mouse support in console
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""
"Colors/fonts
"""""""""""""""""""""""""""""""""""""""""""

syntax enable
colorscheme wombat256mod

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
