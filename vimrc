let &termencoding=&encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,ucs-bom,cp936


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle/Vundle.vim')
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'edkolev/tmuxline.vim'

" Edit
Plugin 'jiangmiao/auto-pairs'
Plugin 'Python-mode-klen'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'heavenshell/vim-pydocstring'
let g:neocomplete#enable_at_startup = 1

" Browsing
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar', { 'on': 'TagbarToggle'      }
Plugin 'derekwyatt/vim-fswitch', { 'for': ['c', 'cpp', 'objc'] }
Plugin 'derekwyatt/vim-protodef', { 'for': ['c', 'cpp', 'objc'] }
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Lint
Plugin 'w0rp/ale'

Plugin 'fholgado/minibufexpl.vim'
Plugin 'sjl/gundo.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'ctrlpvim/ctrlp.vim'
"Do all your insert-mode completion with Tab.
Plugin 'ervandew/supertab'

" Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" Show the size of block one selected in visual mode
set showcmd

" Hide buffers
set hidden
set visualbell

" Indent using four spaces
"set expandtab smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set gcr=a:block-blinkon0

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=m
set guioptions-=T

function! ToggleFullscreen()
call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf

map <silent> <F2> :call ToggleFullscreen()<CR>
imap <silent> <F2> <esc>:call ToggleFullscreen()<CR>
" autocmd VimEnter * call ToggleFullscreen()

" Show the line and column number of the cursor position
set ruler

" Highlight line under cursor
set cursorline
set cursorcolumn


" <<<<
" >>>>
" MAPPINGS

" ----------------------------------------------------------------------------
" Basic mappings
" ----------------------------------------------------------------------------
  
" Profile
iabbrev @@ hmybmny@gmail.com
iabbrev @b hmybmny.com

" Edit myvimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Edit
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Save
inoremap <C-s>     <C-O>:w<cr>
nnoremap <C-s>     :w<cr>
nnoremap <leader>w :w<cr>

" Copy
vnoremap <Leader>y "+y
nmap <Leader>p "+p

" Quit
nnoremap <Leader>q :q<cr>
nnoremap <Leader>Q :qa!<cr>

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>a
inoremap <C-^> <C-o><C-^>

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------

nnoremap ]q :cnext<cr>zz
nnoremap [q :cprev<cr>zz

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------

nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>lw <C-W>l

" ----------------------------------------------------------------------------
" :CopyRTF
" ----------------------------------------------------------------------------

function! s:colors(...)
return filter(map(filter(split(globpath(&rtp, 'colors/*.vim'), "\n"),
    \                  'v:val !~ "^/usr/"'),
    \           'fnamemodify(v:val, ":t:r")'),
    \       '!a:0 || stridx(v:val, a:1) >= 0')
endfunction

" ----------------------------------------------------------------------------
" <F8> | Color scheme selector
" ----------------------------------------------------------------------------
"  
set background=dark

let g:molokai_original = 1
colorschem molokai

function! s:rotate_colors()
  if !exists('s:colors')
    let s:colors = s:colors()
  endif
  let name = remove(s:colors, 0)
  call add(s:colors, name)
  set background=dark
  execute 'colorscheme' name
  redraw
  echo name
endfunction

nnoremap <silent> <F8> :call <SID>rotate_colors()<cr>
inoremap <silent> <F8> <esc>:call <SID>rotate_colors()<cr>

" <<<<
" >>>>
" PLUGINS
" vim-multiple-cursors
" ----------------------------------------------------------------------------


let g:move_key_modifier = 'C'

" ----------------------------------------------------------------------------
" auto-pairs
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" indentLine
" ----------------------------------------------------------------------------
  
let g:indentLine_char = '│'

" ----------------------------------------------------------------------------
" tarbar
" ----------------------------------------------------------------------------

inoremap <F2> <esc>:TagbarToggle<cr>
nnoremap <F2> :TagbarToggle<cr>

let tagbar_left=1
let tagbar_width=32
let g:tagbar_sort = 0
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
 \ 'ctagstype' : 'c++',
 \ 'kinds'     : [
     \ 'c:classes:0:1',
     \ 'd:macros:0:1',
     \ 'e:enumerators:0:0', 
     \ 'f:functions:0:1',
     \ 'g:enumeration:0:1',
     \ 'l:local:0:1',
     \ 'm:members:0:1',
     \ 'n:namespaces:0:1',
     \ 'p:functions_prototypes:0:1',
     \ 's:structs:0:1',
     \ 't:typedefs:0:1',
     \ 'u:unions:0:1',
     \ 'v:global:0:1',
     \ 'x:external:0:1'
 \ ],
 \ 'sro'        : '::',
 \ 'kind2scope' : {
     \ 'g' : 'enum',
     \ 'n' : 'namespace',
     \ 'c' : 'class',
     \ 's' : 'struct',
     \ 'u' : 'union'
 \ },
 \ 'scope2kind' : {
     \ 'enum'      : 'g',
     \ 'namespace' : 'n',
     \ 'class'     : 'c',
     \ 'struct'    : 's',
     \ 'union'     : 'u'
 \ }
\ }

" ----------------------------------------------------------------------------
" vim-fswitch
" ----------------------------------------------------------------------------

nmap <silent> <Leader>fs :FSHere<cr>

" ----------------------------------------------------------------------------
" vim-protodef
" ----------------------------------------------------------------------------

let g:protodefprotogetter='~/.vim/plugged/vim-protodef/pullproto.pl'
let g:disable_protodef_sorting=1

" ----------------------------------------------------------------------------
" nerdcommenter
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" nerdtree
" ----------------------------------------------------------------------------

inoremap <F3> <esc>:NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>

let NERDTreeWinSize=30
let NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1


nnoremap <Leader>md :InstantMarkdownPreview<CR>


" ----------------------------------------------------------------------------
" vim-fugitive
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" vim-gitgutter
" ----------------------------------------------------------------------------
  
set updatetime=250
set signcolumn=yes

" ----------------------------------------------------------------------------
" ale
" ----------------------------------------------------------------------------


" ----------------------------------------------------------------------------
" minibufexpl
" ----------------------------------------------------------------------------

inoremap <F4> <esc>:MBEToggle<cr>
nnoremap <F4> :MBEToggle<cr>

nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" gundo.vim
" ----------------------------------------------------------------------------

nnoremap <Leader>ud :GundoToggle<CR>

set sessionoptions="blank,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"

if !strlen(finddir('~/.vim/undofiles'))
echo "undofiles[~/.vim/undofiles] not found. Now it's being created. Press ENTER or type command to continue."
!mkdir -p ~/.vim/undofiles
endif

if v:version >= 703
set undodir=~/.vim/undofiles
set undofile
set colorcolumn=+1 
endif

" ----------------------------------------------------------------------------
" ctrlsf.vim
" ----------------------------------------------------------------------------

nnoremap <c-f> :CtrlSF<CR>

" ----------------------------------------------------------------------------
" ctrlp.vim
" ----------------------------------------------------------------------------

" Disable output, vcs, archive, rails, temp and backup files
set wildignore+=*.o,*.out,*.obj,.git,*.pyc,*.class
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,*~,._*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_map = '<s-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|vendor/bundle/*\|vendor/cache/*\|public\|spec)$',
  \ 'file': '\v\.(exe|so|dll|swp|log|jpg|png|json)$',
  \ }


set encoding=utf-8
set nu

" Python-mode
" Activate rope
" Keys: 按键：
" K             Show python docs 显示Python文档
" <Ctrl-Space>  Rope autocomplete  使用Rope进行自动补全
" <Ctrl-c>g     Rope goto definition  跳转到定义处
" <Ctrl-c>d     Rope show documentation  显示文档
" <Ctrl-c>f     Rope find occurrences  寻找该对象出现的地方
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled) 断点
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
"            跳转到前一个/后一个类或函数
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
"              跳转到前一个/后一个类或方法
let g:pymode_rope = 1
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_show_doc_bind = '<C-c>d'
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_motion = 1
" Documentation 显示文档
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting 代码查错，=1为启用
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_message = 1
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting 高亮形式
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

"Python 注释
function InsertPythonComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/usr/bin/env python')
    normal o
    call setline('.', '# -*- coding:utf-8 -*-')
	normal o
	call setline('.', '########################################################################')
	normal o
	call setline('.', '#')
	normal o
<<<<<<< HEAD
	call setline('.', '# Copyright (c) 2019 Baidu.com, Inc. All Rights Reserved')
=======
	call setline('.', '# Copyright (c) 2018 Baidu.com, Inc. All Rights Reserved')
>>>>>>> 790d479a811863b791658c23099762a33aa94d20
	normal o
	call setline('.', '#')
	normal o
	call setline('.', '########################################################################')
    normal o
    call setline('.', '"""')
    normal o
    call setline('.', 'Author  :   '.g:python_author)
    normal o
    call setline('.', 'E-mail  :   '.g:python_email)
    normal o
    call setline('.', 'Date    :   '.strftime("%y/%m/%d %H:%M:%S"))
    normal o
    call setline('.', 'Desc    :')
    normal o
    call setline('.', '"""')
    normal o
	call setline('.', '')
	normal o
<<<<<<< HEAD
	call setline('.', 'from __future__ import unicode_literals')
	normal o
	call setline('.', 'from __future__ import print_function')
	normal o
	call setline('.', 'import sys')
	normal o
	call setline('.', 'import os')
	normal o
=======
	call setline('.', 'import sys')
	normal o
>>>>>>> 790d479a811863b791658c23099762a33aa94d20
	call setline('.', 'import logging')
	normal o
	call setline('.', '')
	normal o
<<<<<<< HEAD
	call setline('.', 'CUR_DIR = os.path.dirname(os.path.abspath(__file__))')
	normal o
	call setline('.', "LOG_FORMAT = '''[%(levelname)s] [%(asctime)s] [%(threadName)s] [%(name)s] '''")
	normal o
	call setline('.', "LOG_FORMAT += '''[%(filename)s:%(funcName)s:%(lineno)d]: %(message)s'''")
=======
	call setline('.', "log_format = '''[%(levelname)s] [%(asctime)s] [%(threadName)s] [%(name)s] '''")
	normal o
	call setline('.', "log_format += '''[%(filename)s:%(funcName)s:%(lineno)d]: %(message)s'''")
>>>>>>> 790d479a811863b791658c23099762a33aa94d20
	normal o
	call setline('.', 'logging.basicConfig(')
	normal o
	call setline('.', '    stream=sys.stderr,')
	normal o
	call setline('.', '    level=logging.INFO,')
	normal o
<<<<<<< HEAD
	call setline('.', "    format=LOG_FORMAT")
=======
	call setline('.', "    format=log_format")
>>>>>>> 790d479a811863b791658c23099762a33aa94d20
	normal o
	call setline('.', ')')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
<<<<<<< HEAD
    call cursor(30, 0)
=======
    call cursor(27, 0)
>>>>>>> 790d479a811863b791658c23099762a33aa94d20
endfunction
function InsertCommentWhenOpen()
    if a:lastline == 1 && !getline('.')
        call InsertPythonComment()
    end
endfunc
au FileType python :%call InsertCommentWhenOpen()
let g:python_author = 'xuechengyun'
<<<<<<< HEAD
let g:python_email  = 'xuechengyun@baidu.com' 

"shell 注释
function InsertShellComment()
    exe 'normal'.1.'G'
    let line = getline('.')
    if line =~ '^#!.*$' || line =~ '^#.*coding:.*$'
        return
    endif
    normal O
    call setline('.', '#!/bin/bash')
    normal o
	call setline('.', '########################################################################')
	normal o
	call setline('.', '#')
	normal o
	call setline('.', '# Copyright (c) 2019 Baidu.com, Inc. All Rights Reserved')
	normal o
	call setline('.', '#')
	normal o
	call setline('.', '########################################################################')
    normal o
    call setline('.', '# Author  :   '.g:python_author)
    normal o
    call setline('.', '# E-mail  :   '.g:python_email)
    normal o
    call setline('.', '# Date    :   '.strftime("%y/%m/%d %H:%M:%S"))
    normal o
    call setline('.', '# Desc    :')
    normal o
	call setline('.', '########################################################################')
    normal o
	call setline('.', '')
	normal o
    call setline('.', '# set -x')
	normal o
	call setline('.', 'CUR_DIR=$(cd `dirname $0`; pwd)')
	normal o
	call setline('.', 'cd ${CUR_DIR}')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', '')
	normal o
	call setline('.', 'cd -')
	normal o
    call cursor(17, 0)
endfunction
function InsertShellCommentWhenOpen()
    if a:lastline == 1 && !getline('.')
        call InsertShellComment()
    end
endfunc
au FileType sh :%call InsertShellCommentWhenOpen()
let g:python_author = 'xuechengyun'
let g:python_email  = 'xuechengyun@baidu.com' 

set ttyfast
set lazyredraw
=======
let g:python_email  = 'xuechengyunxue@gmail.com' 
set ttyfast
set lazyredraw
au FileType go set nocursorcolumn
au FileType go syntax sync minlines=128
au FileType go set synmaxcol=128
au FileType go set re=1
>>>>>>> 790d479a811863b791658c23099762a33aa94d20

" jedi
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader><leader>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_on_dot = 0
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
<<<<<<< HEAD
nmap <silent> <C-_> <Plug>(pyd)
set ttyfast
set lazyredraw

" jedi
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<leader><leader>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#popup_on_dot = 0
let g:SuperTabDefaultCompletionType="context"
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
nmap <silent> <C-_> <Plug>(pyd)

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
=======
>>>>>>> 790d479a811863b791658c23099762a33aa94d20
