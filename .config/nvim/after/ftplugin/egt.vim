set ts=3
set sw=3
set expandtab
set si
function! EgtAnnotate()
    let l:cur_pos = getpos(".")
    :%!egt annotate --stdin %:p
    call setpos(".", l:cur_pos)
endfunction
autocmd BufWritePre,FileWritePre <buffer> :silent call EgtAnnotate()
