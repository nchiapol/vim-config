if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Recognise egt files
  au! BufNewFile,BufRead *.egt,.egt setf egt
augroup END
