# yes
#
syntax on
colorscheme desert
autocmd BufNewFile,BufRead *.py call Py()
function Py()
    set fdm=indent
endfunction 
autocmd BufNewFile,BufRead *.cpp call Cpp()
function Cpp()
    set fdm=marker
endfunction 

set fileencodings=utf-8,gb18030,utf-16,big5
set backspace=2
set rnu
set ts=2
set expandtab
set nobackup
set noswapfile
set tabstop=4
set shiftwidth=4
set autoindent
set mouse=a
set cursorline

" 搜索设置
set ignorecase
set incsearch
highlight Search ctermbg=yellow ctermfg=black 
highlight IncSearch ctermbg=black ctermfg=yellow 
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
"set hlsearch

set splitright

autocmd BufNewFile *.tex 0r ~/.vim/template/tex.tlp
"set spell "开启拼写核对
let mapleader=" "
""autocmd winleave * :w<cr>
set updatetime=60000
au CursorHold * w 

noremap Q :q<cr>
noremap S :w<cr>
noremap <leader>n :cn<cr>
noremap <leader>p :cp<cr>
noremap Y   "+y 
noremap P   "+p
map <leader>a  ggvGYg;
"noremap mp :MarkdownPreview<cr>
inoremap jj <esc>
inoremap kk <esc>
inoremap <c-x> <esc><right>s
inoremap <c-f> <right>
inoremap <c-b> <left>
inoremap <c-e> <esc>A
inoremap <c-j> <c-o>o
filetype off
syntax on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
""" 加载插件
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'dense-analysis/ale'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'preservim/nerdtree'
Plugin 'lervag/vimtex'

Plugin 'skywind3000/asyncrun.vim'
call vundle#end()
filetype plugin indent on     " required

""""""""""""""""""""""" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

""""ycm
""跳转
nnoremap * :YcmCompleter GoToDefinitionElseDeclaration<CR>
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0 "关闭预览
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python3'
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_key_list_select_completion = ['\<c-n>', '\<Down>']
let g:ycm_key_list_previous_completion = ['\<c-p>', '\<Up>']

"""""nerdTree
""""自动打开""""
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
""不显示以下文件""""
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
""""更改默认箭头""""
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
""快捷键""
""ctr + w + w: 光标在目录树与文件间切换
""ctr + w + r: 切换当前窗口的左右布局
""g + T: 切换到前一个tab
""g + t: 切换到后一个tab
""ctr + p: 模糊搜索文件
""i split 一个窗口
""! 执行当前文件
""X 合拢所有目录
""p 跳转到根节点
""P 跳转到父节点
""u 选中当前为根节点
""I 显示隐藏文件
""F 是否显示文件
""
"""""""""""""airline
""let g:airline_theme='bubblegum'
""let g:airline#extensions#tabline#enabled = 1
"""sniffer"""
" 如果需要更多配置可以在vimrc中输入下面的，不配置使用默认的设置
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsListSnippets = "<c-l>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/bundle/vim-snippets/UltiSnips']
""help UltiSnips-snippet-options  查看snippet中的可选项 
"b 这个关键词只有出现在行首的时候，才能被展开。
"A 代表自动展开
"i 表示可以护绿前后的字节，直接展开关键词。

""""""markownPreview""""""
" set to 1, nvim will open the preview window after entering the markdown buffer
"
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

""""""NERDtree""""""
nmap T :NERDTree<cr>

"""""""vimtex"""""""
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
"let g:vimtex_view_method='skim'
let g:vimtex_view_general_viewer='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
"sudo tlmgr install latexmk --repository http://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/tlnet
let g:vimtex_syntax_conceal = {
          \ 'accents': 1,
          \ 'cites': 1,
          \ 'fancy': 1,
          \ 'greek': 1,
          \ 'math_bounds': 1,
          \ 'math_delimiters': 1,
          \ 'math_fracs': 1,
          \ 'math_super_sub': 1,
          \ 'math_symbols': 1,
          \ 'sections': 1,
          \ 'styles': 1,
          \}
"""""""AsynRun""""""
let g:asyncrun_status = "stopped" 
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

"function Ch()
"    let index = col('.')
"    let s = " ".getline('.')
"    while index==1 || s[index]!=' '
"        if index==0
"        else fsdf 
"         
"            call cursor(line('.'),index-1)
"        endif
"    endwhile
"    if index==0
"    elseif s[index-1]!=' '
"        call cursor(line('.'),index)
"    endif 
"    i
"endfunction
function Formation()
    exe "normal! gg/View the changes\<cr>"
    exe "normal! jjdgg"
    exe "normal! gg/func\<cr>"
    exe "normal! kkdG"
    exe "%s/<p>/\r/g" 
    exe "%s/<[^>]*>//g"
    exe "%s/\$\$//g"
    exe "%s/\n/\r\r/g"
endfunction

noremap <leader>t :call Test()<cr>
function Test()
    exe "w"
    if &filetype=='cpp'
        exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom cf test %"
    endif
endfunction

noremap <leader>s :call Submit()<cr>
function Submit()
    exe "w"
    if &filetype=='cpp'
        exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom cf submit -f % %< "
    endif
endfunction

noremap <leader>m :call Run()<cr>
function Run()
    exe "w"
    if &filetype=='md'
        exe "MarkdownPreview"
    elseif &filetype=='python'
        exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom python \"$(VIM_FILEPATH)\""
    elseif &filetype=='sh'
        exe "AsyncRun -cwd=$(VIM_FILEDIR) -mode=term -pos=bottom bash \"$(VIM_FILEPATH)\""
    elseif &filetype=='c'
        exe "AsyncRun  gcc \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\""
        while g:asyncrun_status=='running'
            sleep 100m
        endwhile
        if g:asyncrun_status!='failure'
            exe "copen"
        else 
            exe "AsyncRun -mode=term -pos=bottom $(VIM_PATHNOEXT)"
        endif
    elseif &filetype=='cpp'
        "exe "AsyncRun -mode=0  g++ -O3 \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" -lpthread"
        exe "AsyncRun -mode=0  g++ -O3 $(pkg-config --cflags --libs opencv) -std=c++11 \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" -lpthread"
        while g:asyncrun_status=='running'
            sleep 100m
        endwhile
        if g:asyncrun_status=='failure'
            exe "copen"
        else 
            exe "AsyncRun -mode=term -pos=bottom $(VIM_PATHNOEXT)"
        endif
    endif
endfunction
