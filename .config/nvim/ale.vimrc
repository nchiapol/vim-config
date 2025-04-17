" configure python
" only use pylint
let g:ale_linters={
\ 'python': ['bandit','pylint'],
\}
" use my default pylintrc
let g:ale_python_pylint_options = '--rcfile /home/nchiapol/.config/nvim/ale-linter-conf/pylint'

" configure markdown (aggressively switched off)
let g:ale_markdown_mdl_options = '--style /home/nchiapol/.config/nvim/ale-linter-conf/markdownlint.rb'
