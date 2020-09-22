" According to
"   https://arnaudr.io/2020/08/17/modify-vim-syntax-files-for-your-taste/
"
" H1 and H2 headings -> bold
hi link markdownH1 markdownHxBold
hi link markdownH2 markdownHxBold
" Heading delimiters (eg '#') and rules (eg '----', '====') -> bold
hi link markdownHeadingDelimiter markdownHxBold
hi link markdownRule markdownHxBold
" Code blocks and inline code -> highlighted
hi link markdownCode htmlH1

" The following test requires this addition to your vimrc:
" autocmd OptionSet background if exists("g:syntax_on") | syntax on | endif
if &background == "light"
  hi markdownHxBold term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta cterm=bold
else
  hi markdownHxBold term=bold ctermfg=LightMagenta gui=bold guifg=Magenta cterm=bold
endif
