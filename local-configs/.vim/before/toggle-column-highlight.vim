function! ToggleColumnHighlight()
    if (g:column_highlight == 0)
        let g:column_highlight = 1
        execute "set colorcolumn=".g:column_number_highlight
        execute "set textwidth=".g:column_number_highlight
    else
        let g:column_highlight = 0
        set colorcolumn=0
        set textwidth=0
    endif
endfunction
