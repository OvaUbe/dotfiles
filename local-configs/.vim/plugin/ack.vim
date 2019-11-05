if executable('rg')
	let g:ackprg = 'rg --vimgrep --no-heading'
endif
let g:ack_use_dispatch = 0
nnoremap <leader>s :Ack -w <C-r><C-w><CR>
