packadd! python-jedi

" do not list attributes when typing . (too slow to load)
let g:jedi#popup_on_dot=0
" do (not) show call hints
let g:jedi#show_call_signatures=0
" when jumping to definition use new window
let g:jedi#use_splits_not_buffers='winwidth'
