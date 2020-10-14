" Syntastic
"" Recommended settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': ["tex"] }
" nnoremap <C-w>c :SyntasticCheck<CR>  " deactivated, using leader instead

"" Display checker-name for that error-message
let g:syntastic_aggregate_errors = 1

let g:syntastic_python_checkers = ['pylint'] " ['pylint', 'python', 'pep8', 'pyflakes']

"" easy switching of python version
"function Py2()
"  let g:syntastic_python_python_exec = '/usr/bin/python'
"  let g:syntastic_python_pylint_exec = '/usr/bin/pylint'
"  let g:syntastic_python_pep8_exec = '/usr/bin/pycodestyle'
"  let g:syntastic_python_pyflakes_exec = '/usr/bin/pyflakes'
"endfunction

function Py3()
  let g:syntastic_python_pylint_exec = '/usr/bin/python3'
  let g:syntastic_python_pylint_exec = '/usr/bin/pylint'
  let g:syntastic_python_pep8_exec = '/usr/bin/pycodestyle'
  let g:syntastic_python_pyflakes_exec = '/usr/bin/pyflakes3'
endfunction

call Py3()   " default to Py3 because I try to use it when possible
