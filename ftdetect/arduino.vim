augroup filetypedetect
	au! BufNewFile,BufRead *.ino setf arduino
augroup END

autocmd Filetype arduino set errorformat^=\%-G%.%#/usr/share/arduino/%.%# 
