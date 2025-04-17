" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set cmdheight=2         " the command bar is 2 high
set number              " turn on line numbers
set expandtab           " replace \t with spaces when saving
set shiftwidth=4        " automtic indent is 4 columns
set ignorecase          " search is case insensitive
set smartcase           " UNLESS it cointains an uppercase char
set undofile            " create .<filename>.un~ to allow undo after close+open

let mapleader = ","
" strip all trailing whitespace
nnoremap <leader>c :%s/\s\+$//<cr>:let @/=''<CR>
" split vertically and switch
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W <C-w>s<C-w>j
" and speed up moves
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" clean search highlights (useful if `set hlsearch` is active)
nnoremap <leader><space> :noh<CR>
" map ,u to undo movement
nnoremap <leader>u <C-o>
" markdown titles
nnoremap <leader>= yypV`]r=o
nnoremap <leader>- yypV`]r-o

" lets try to use vim the hardcore way
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" deactivate arrows even in insert mode (very annoying)
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" avoid the help-menu
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" add alias for ESC
inoremap jj <ESC>
" kk does happen in german: e.g. Bankkonto, Parkkarte
" inoremap kk <ESC>

" move to the matching bracket with tab
nnoremap <tab> %

" with existing selection, let Y copy to clipboard
vnoremap Y "+y

" configure filename auto-completion
set wildmode=longest,list:longest,list:full

" integrate fzy (requires neovim - and fzy installed)
nnoremap <leader>e <cmd>lua require'fuzzy-search'.FuzzySearch()<cr>

" toggle neovim diagnostics
nnoremap <leader>t <cmd>lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<cr>

" create a shortcut for fixing python files
" this should probably be moved to a file-type specific file
nnoremap <leader>f :ALEFix black<cr>

" highlight trailing whitespace with red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
augroup HighlightWhitespace
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END

" auto-wrap at 78 characters
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" configure airline display
source ~/.config/nvim/airline.vimrc

" activate and configure python-jedi
source ~/.config/nvim/jedi.vimrc

" configure ale
source ~/.config/nvim/ale.vimrc

" prevent leaking from password files
source ~/.config/nvim/redact_pass.vimrc
