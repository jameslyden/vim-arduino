" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif
let b:did_ftplugin = 1

setlocal cindent
setlocal cinkeys-=0#
setlocal formatoptions-=t formatoptions+=croql
setlocal suffixesadd=.ino

let b:undo_ftplugin = "set cin< cink< fo< sua< et< sw< ts<"


if has("python")

    if !exists("g:arduino_doc_style")
        let g:arduino_doc_style = "web"
    endif

    if !exists("g:arduino_doc_path")
        let g:arduino_doc_style = "web"
    endif

function! ArduinoDoc()
python << ENDPY
import vim
import re
import webbrowser
from os import path

def launchDocFile(filename):
    docfile = path.join(basepath, filename)
    if path.exists(docfile) and path.isfile(docfile):
        webbrowser.open(docfile)
        return True
    return False

def launchDocWeb(filename):
    docfile = "http://http://arduino.cc/en/Reference/"
    webbrowser.open(docfile+filename)
    return True

def wordStart(line, column):
    start = column
    for i in reversed(range(column)):
        if line[i].isalnum():
            start = i
        else:
            break
    return start

if vim.eval("g:arduino_doc_style") == "local":
    basepath = path.abspath(vim.eval("g:arduino_doc_path"))
    launchDoc = launchDocFile
else:
    launchDoc = launchDocWeb

(row, col) = vim.current.window.cursor
line = vim.current.line

col = wordStart(line, col)
if re.match(r"\w+\s*\(", line[col:]):
    if col < 4:
        fun = True
    else:
        col -= 4
        if re.match(r"new\s*\w+\s*\(", line[col:]):
            fun = False
        else:
            fun = True
else:
    fun = False

word = vim.eval('expand("<cword>")')
word = word.title()


if word:
    if fun:
        success = launchDoc(word + "*.html") or launchDoc(word + ".html") or launchDoc(word + "")
    else:
        success = launchDoc(word + ".html") or launchDoc(word + "*.html") or launchDoc(word + "")
    if not success:
        print "Identifier", '"' + word + '"', "not found in the documentation."

ENDPY
endfunction

nnoremap <silent> <buffer> K :call ArduinoDoc()<CR>

endif "has("python")

