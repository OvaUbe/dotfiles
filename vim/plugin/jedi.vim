let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#goto_command = "<C-g><C-g>"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>ri"
let g:jedi#usages_command = "<leader>rf"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>rw"
let g:jedi#completions_enabled = 0
let g:jedi#smart_auto_mappings = 0

au FileType python setlocal omnifunc=jedi#completions
