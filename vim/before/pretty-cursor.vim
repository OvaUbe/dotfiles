function! PrettyCursor()
    if &term =~ 'xterm\|.*rxvt.*'
        let cursor_color = "\033]12;white\x7"
        let cursor_shape = "\033[1 q"

        let &t_SI = cursor_color
        let &t_EI = cursor_color

        let insert_cursor_shape = "\033[5 q"

        let &t_SI .= insert_cursor_shape
        let &t_EI .= cursor_shape
    endif
endfunction
