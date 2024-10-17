" a vimrc file compiled from many snippets and probably not completely
" consitent

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set t_kb=
set t_kD=[3~
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
endif
set background=dark     " using a dark terminal background

" config UI
set history=50		    " keep 50 lines of command line history
set ruler		        " show the cursor position all the time
set lsp=0               " space it out a little more (easier to read)
set wildmenu            " turn on wild menu
set showcmd		        " display incomplete commands
set cmdheight=2         " the command bar is 2 high
set number              " turn on line numbers
set lz                  " do not redraw while running macros (much faster) (LazyRedraw)
set hidden              " you can change buffer without saving
set backspace=2         " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
"set mouse=a             " use mouse everywhere
set shortmess=atI       " shortens messages to avoid 'press a key' prompt
set report=0            " tell us when anything is changed via :...
set noerrorbells        " don't make noise
set softtabstop=4       " pressing tab indents by 4 columns
set shiftwidth=4        " automtic indent is 4 columns
set tabstop=4           " \t is displayed as 4 spaces
set expandtab           " replace \t with spaces when saving
set ignorecase          " search is case insensitive
set smartcase           " UNLESS it cointains an uppercase char

" more UI from https://stevelosh.com/blog/2010/09/coming-home-to-vim
set encoding=utf-8      " set encoding used when displaying
set scrolloff=3         " scroll offset: leave n lines below/above when scrolling
set showmode            " show mode at bottom
"set visualbell          " flash window on errors
"set cursorline          " underline line with cursor
set ttyfast             " indicate fast terminal connection
"set relativenumber      " make line-numbers relative to current line
set undofile            " create .<filename>.un~ to allow undo after close+open
"set colorcolumn=85      " show ugly colored column

" highlighting
set showmatch     " show matching brackets
"set mat=5         " how many tenths of a second to blink matching brackets for
set hlsearch      " do highlight searched for phrases (cleared with `<leader><space>` see below)
set incsearch     " BUT do highlight as you type you search phrase

" make the splitters between windows be blank
set fillchars=vert:\ ,stl:\ ,stlnc:\

" configs statusline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2    " always show the status line


let mapleader = ","
" run syntastic checker and focus location list
nnoremap <leader>C :SyntasticCheck<CR> <C-w>j
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
" select pasted content
nnoremap <leader>v V`]
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

" try to get middleclick paste to work
set nopaste
if has("gui_running")
  "mouse visual block (ala MS Word)
  nmap <A-LeftMouse> ms<LeftMouse><C-v>`so
  imap <A-LeftMouse> <Esc><C-v>`^ms<Esc>gi<LeftMouse><C-o><C-v>`so
  vmap <A-LeftDrag> <LeftDrag>
  vmap <A-LeftMouse> <C-v><LeftMouse>msgv`s
  vmap <S-LeftMouse> v<LeftMouse>msgv`s
  set mouse=ra
else
  "xterm mouse with middleclick paste
  nnoremap <MiddleMouse> i<MiddleMouse>
  vnoremap <MiddleMouse> s<MiddleMouse>
  set pastetoggle=<F7> mouse=rnv
  "choose either one
  if !has('nvim')
    set ttymouse=xterm
    "set ttymouse=xterm2
  endif
endif

"paste toggle
nmap <F7> :set paste! paste?<CR>
imap <F7> <C-o>:set paste!<CR>
vmap <F7> <Esc>:set paste!<CR>gv

" configure filename auto-completion
set wildmode=longest,list:longest,list:full

" integrate fzy (requires neovim - and fzy installed)
nnoremap <leader>e <cmd>lua require'fuzzy-search'.FuzzySearch()<cr>

" add :w!! as 'sudo save'
cmap w!! w !sudo tee % >/dev/null


" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  au BufNewFile,BufRead *.opts setfiletype c

  highlight TrailWhitespace ctermbg=red guibg=red
  autocmd Syntax * syn match TrailWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

  " get rid of pydoc preview from jedi-vim
  autocmd FileType python setlocal completeopt-=preview

  " needed for ~/.vim/after/syntax/markdown.vim
  autocmd OptionSet background if exists("g:syntax_on") | syntax on | endif

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

source ~/.vim/airline.vimrc

"" configure python-jedi
" do not list attributes when typing . (too slow to load)
let g:jedi#popup_on_dot=0
" do (not) show call hints
let g:jedi#show_call_signatures=0
" when jumping to definition use new window
let g:jedi#use_splits_not_buffers='winwidth'

":fixdel
":if &term == "xterm"
":  set t_kb=^V<BS>
":  fixdel
":endif

highlight Pmenu ctermfg=DarkBlue  ctermbg=LightGrey
highlight PmenuSel cterm=bold ctermfg=Brown ctermbg=LightGrey

