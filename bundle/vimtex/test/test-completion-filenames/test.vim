set nocompatible
let &rtp = '../..,' . &rtp
filetype plugin on

nnoremap q :qall!<cr>

silent edit main.tex

if empty($INMAKE) | finish | endif

let s:candidates = vimtex#test#completion('\input{', '')
call assert_equal(len(s:candidates), 4)

let s:candidates = vimtex#test#completion('\include{', '')
call assert_equal(s:candidates[0].word, 'main')

let s:candidates = vimtex#test#completion('\includeonly{', '')
call assert_equal(len(s:candidates), 4)

let s:candidates = vimtex#test#completion('\subfile{', '')
call assert_equal(len(s:candidates), 2)

let s:candidates = vimtex#test#completion('\subfile{', '')
call assert_equal(s:candidates[1].word, 'tikz_pic.tex')

let s:candidates = vimtex#test#completion('\includegraphics{', '')
call assert_equal(len(s:candidates), 26)
call assert_equal(s:candidates[10].word, 'figures/example1.tikz')
call assert_equal(s:candidates[10].abbr, 'figures/example1.tikz')

let s:candidates = vimtex#test#completion('\includegraphics[scale=0.5]{', '')
call assert_equal(len(s:candidates), 26)

let s:candidates = vimtex#test#completion('\includegraphics[100,100][300,300]{', '')
call assert_equal(len(s:candidates), 26)

let s:candidates = vimtex#test#completion('\includegraphics{', 'new_fig')
call assert_equal(len(s:candidates), 9)
call assert_equal(s:candidates[0].word, 'new_fig1.jpg')
call assert_equal(s:candidates[0].abbr, 'my figures/new_fig1.jpg')

let s:candidates = vimtex#test#completion('\includestandalone{', '')
call assert_equal(len(s:candidates), 2)

let s:candidates = vimtex#test#completion('\includepdf{', '')
call assert_equal(s:candidates[0].word, 'figures/fig12.pdf')

call vimtex#test#finished()
