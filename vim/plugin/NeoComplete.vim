let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#min_keyword_length = 4
let g:neocomplete#sources#dictionary#dictionaries = {'default' : '', 'vimshell' : $HOME.'/.vimshell_hist'}

if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
if !exists('g:neocomplete#delimiter_patterns')
	let g:neocomplete#delimiter_patterns= {}
endif
if !exists('g:neocomplete#sources')
	let g:neocomplete#sources = {}
endif
let g:neocomplete#sources.cpp = ['omni']
let g:neocomplete#delimiter_patterns.cpp = ['::', '.', '->']

inoremap <expr><C-g> neocomplete#undo_completion()
